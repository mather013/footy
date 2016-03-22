require 'spec_helper'

module Jobs
  describe SyncFixtures do

    describe 'instance methods' do
      let(:fixture_feed_service) { "Feed::#{TOGGLES_CONFIG['feed'].camelize.to_s}::Fixture".constantize }

      describe '#perform' do
        let(:external_id) { nil }
        let(:feed_kickoff) { DateTime.parse('2016-03-18 20:00') }
        let(:fixture_kickoff) { DateTime.parse('2014-11-03 20:00') }
        let(:sync_fixtures) { Jobs::SyncFixtures.new }
        let(:home_team) { double(Team, id: 1, abbreviation: 'arg') }
        let(:away_team) { double(Team, id: 2, abbreviation: 'bra') }
        let(:week) { Week.create(id: 13, description: 'Week 13', close_date: '2015-01-01 12:00:00') }
        let(:feed_status) { Fixture::Status::SCHEDULED }

        let(:feed_fixtures) { [double(fixture_feed_service, id: 999,
                                      home_team_id: 1,
                                      away_team_id: 2,
                                      kickoff: feed_kickoff,
                                      status: feed_status)] }

        let(:fixture) { Fixture.create(external_id: external_id,
                                       kickoff: fixture_kickoff,
                                       week_id: week.id,
                                       name: 'ARG-BRA') }

        before :each do
          Fixture.stub(:requiring_sync).and_return(fixtures_requiring_sync)
          Fixture.stub(:find_by_name).and_return(fixture)

          Team.stub(:find_by_external_id).with(1).and_return(home_team)
          Team.stub(:find_by_external_id).with(2).and_return(away_team)

          sync_fixtures.stub(:fixtures_from_feed).and_return(feed_fixtures)
        end

        context 'there are no fixtures to sync' do
          let(:fixtures_requiring_sync) { [] }

          it 'does not attempt to sync fixture information ' do
            sync_fixtures.perform
            sync_fixtures.should_not have_received(:fixtures_from_feed)
          end
        end

        context 'there are fixtures to sync' do
          let(:fixtures_requiring_sync) { ['some_fixtures'] }

          context 'fixture is found' do

            context 'external_id does not exists' do

              context 'fixture has been postponed' do
                let(:feed_status) { Fixture::Status::POSTPONED }

                it 'updates external_id, kickoff and status of the expected fixture' do
                  sync_fixtures.perform

                  sync_fixtures.should have_received(:fixtures_from_feed)
                  Fixture.should have_received(:find_by_name).with('ARG-BRA')
                  expect(fixture.external_id).to eq(999)
                  expect(fixture.kickoff).to eq(feed_kickoff)
                  expect(fixture.status).to eq(Fixture::Status::POSTPONED)
                  expect(Week.find(week.id).close_date).to eq(feed_kickoff)
                end
              end

              context 'fixture has been scheduled' do

                it 'updates external_id, kickoff and status of the expected fixture' do
                  sync_fixtures.perform

                  sync_fixtures.should have_received(:fixtures_from_feed)
                  Fixture.should have_received(:find_by_name).with('ARG-BRA')
                  expect(fixture.external_id).to eq(999)
                  expect(fixture.kickoff).to eq(feed_kickoff)
                  expect(fixture.status).to eq(Fixture::Status::SCHEDULED)
                  expect(Week.find(week.id).close_date).to eq(feed_kickoff)
                end
              end

              context 'fixture has finished' do
                let(:feed_status) { Fixture::Status::FINISHED }

                it 'updates external_id, kickoff and status of the expected fixture' do
                  sync_fixtures.perform

                  sync_fixtures.should have_received(:fixtures_from_feed)
                  Fixture.should have_received(:find_by_name).with('ARG-BRA')
                  expect(fixture.external_id).to eq(999)
                  expect(fixture.kickoff).to eq(feed_kickoff)
                  expect(fixture.status).to eq(Fixture::Status::FINISHED)
                  expect(Week.find(week.id).close_date).to eq(feed_kickoff)
                end
              end
            end

            context 'external_id exists' do
              let(:external_id) { 123 }

              it 'does not update expected fixture' do
                sync_fixtures.perform

                sync_fixtures.should have_received(:fixtures_from_feed)
                Fixture.should have_received(:find_by_name).with('ARG-BRA')
                fixture.should_not have_received(:update_attributes)
                expect(Week.find(week.id).close_date).to eq('2015-01-01 12:00:00')
              end
            end
          end

          context 'fixture is not found' do
            let(:fixture) { nil }

            it 'does not update expected fixture' do
              sync_fixtures.perform

              sync_fixtures.should have_received(:fixtures_from_feed)
              Fixture.should have_received(:find_by_name).with('ARG-BRA')
              fixture.should_not have_received(:update_attributes)
              expect(Week.find(week.id).close_date).to eq('2015-01-01 12:00:00')
            end
          end
        end
      end
    end
  end
end
