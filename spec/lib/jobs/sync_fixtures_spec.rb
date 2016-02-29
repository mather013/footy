require 'spec_helper'

module Jobs
  describe SyncFixtures do

    describe 'instance methods' do
      let(:fixture_feed_service) { "Feed::#{TOGGLES_CONFIG['feed'].camelize.to_s}::Fixture".constantize }

      describe '#perform' do
        let(:external_id) { nil }
        let(:kickoff) { DateTime.parse('2014-11-03 20:00') }
        let(:sync_fixtures) { Jobs::SyncFixtures.new }
        let(:home_team) { double(Team, id: 1, abbreviation: 'arg') }
        let(:away_team) { double(Team, id: 2, abbreviation: 'bra') }
        let(:week) { Week.create(id: 13, description: 'Week 13', close_date: '2015-01-01 12:00:00') }
        let(:feed_fixtures) { [double(fixture_feed_service, home_team_id: 1, away_team_id: 2, id: 999, kickoff: kickoff)] }
        let(:fixture) { Fixture.create(external_id: external_id, kickoff: DateTime.now, week_id: week.id, name: 'ARG-BRA') }

        before :each do
          Fixture.stub(:requiring_sync).and_return(fixtures_requiring_sync)
          Fixture.stub(:find_by_name).and_return(fixture)

          Team.stub(:find_by_external_id).with(1).and_return(home_team)
          Team.stub(:find_by_external_id).with(2).and_return(away_team)

          sync_fixtures.stub(:fixtures_from_feed).and_return(feed_fixtures)
        end

        context 'when there are no fixtures to sync' do
          let(:fixtures_requiring_sync) { [] }

          it 'does not attempt to sync fixture information ' do
            sync_fixtures.perform
            sync_fixtures.should_not have_received(:fixtures_from_feed)
          end
        end

        context 'when there are fixtures to sync' do
          let(:fixtures_requiring_sync) { ['some_fixtures'] }

          context 'and fixture is found' do

            context 'and the external_id does not exists' do

              before :each do
                sync_fixtures.perform
              end

              it 'attempts to sync fixture information' do
                sync_fixtures.should have_received(:fixtures_from_feed)
              end

              it 'attempts to find the fixture using expected teams' do
                Fixture.should have_received(:find_by_name).with('ARG-BRA')
              end

              it 'updates external_id of the expected fixture' do
                expect(fixture.external_id).to eq(999)
                expect(fixture.kickoff).to eq(kickoff)
              end

              it 'updates the week.close_date to correspond with kickoff of first fixture' do
                expect(Week.find(week.id).close_date).to eq(kickoff)
              end

            end

            context 'but the external_id exists' do
              let(:external_id) { 123 }

              before :each do
                fixture.stub(:update_attributes).with(external_id: 999, kickoff: kickoff)
                sync_fixtures.perform
              end

              it 'attempts to sync fixture information' do
                sync_fixtures.should have_received(:fixtures_from_feed)
              end

              it 'attempts to find the fixture using expected teams' do
                Fixture.should have_received(:find_by_name).with('ARG-BRA')
              end

              it 'does not update expected fixture' do
                fixture.should_not have_received(:update_attributes)
              end
            end
          end

          context 'and fixture is not found' do
            let(:fixture) { nil }

            before :each do
              sync_fixtures.perform
            end

            context 'and the external_id exists' do
              let(:external_id) { 123 }

              it 'does not update expected fixture' do
                fixture.should_not have_received(:update_attributes)
              end
            end

            context 'but the external_id does not exists' do
              it 'does not update expected fixture' do
                fixture.should_not have_received(:update_attributes)
              end
            end

          end
        end
      end
    end
  end
end
