require 'spec_helper'

module Jobs
  describe SyncFixtures do

    describe 'instance methods' do

      describe '#perform' do
        let(:feed_id) { nil }
        let(:kickoff) { DateTime.parse('2014-11-03 20:00') }
        let(:sync_fixtures) { Jobs::SyncFixtures.new }
        let(:home_team) { double(Team, id: 1, abbreviation: 'arg') }
        let(:away_team) { double(Team, id: 2, abbreviation: 'bra') }
        let(:feed_fixtures) { [double(Feed::Fixture, home_team_id: 1, away_team_id: 2, id: 999, kickoff: kickoff)] }
        let(:fixture) { double(Fixture, feed_id: feed_id, kickoff: DateTime.now) }

        before :each do
          Fixture.stub(:requiring_sync).and_return(fixtures_requiring_sync)
          Fixture.stub(:find_by_name).and_return(fixture)
          fixture.stub(:update_attributes).with(feed_id: 999, kickoff: kickoff)

          Team.stub(:find_by_feed_id).with(1).and_return(home_team)
          Team.stub(:find_by_feed_id).with(2).and_return(away_team)

          sync_fixtures.stub(:fixtures_from_feed).and_return(feed_fixtures)
          sync_fixtures.perform
        end

        context 'when there are no fixtures to sync' do
          let(:fixtures_requiring_sync) { [] }

          it 'does not attempt to sync fixture information ' do
            sync_fixtures.should_not have_received(:fixtures_from_feed)
          end
        end

        context 'when there are fixtures to sync' do
          let(:fixtures_requiring_sync) { ['some_fixtures'] }

          it 'attempts to sync fixture information' do
            sync_fixtures.should have_received(:fixtures_from_feed)
          end

          it 'attempts to find the fixture using expected teams' do
            Fixture.should have_received(:find_by_name).with('ARG-BRA')
          end

          context 'and fixture is found' do

            context 'and the feed_id does not exists' do
              it 'updates feed_id of the expected fixture' do
                fixture.should have_received(:update_attributes).with(feed_id: 999, kickoff: kickoff)
              end
            end

            context 'but the feed_id exists' do
              let(:feed_id) { 123 }
              it 'does not update expected fixture' do
                fixture.should_not have_received(:update_attributes)
              end
            end
          end

          context 'and fixture is not found' do
            let(:fixture) { nil }

            context 'and the feed_id exists' do
              let(:feed_id) { 123 }
              it 'does not update expected fixture' do
                fixture.should_not have_received(:update_attributes)
              end
            end

            context 'but the feed_id does not exists' do
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
