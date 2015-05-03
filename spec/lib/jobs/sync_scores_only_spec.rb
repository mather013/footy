require 'spec_helper'

module Jobs
  describe SyncScoresOnly do

    describe 'instance methods' do

      describe '#perform' do
        let(:sync_scores) { Jobs::SyncScoresOnly.new }
        let(:fixtures_finished) { true }
        let(:events_fixture_one) { [Feed::Event.new(id: '19525541', match_id: '1952554', event_type: 'goal',
                                                    minute: '31',
                                                    team: 'visitorteam',
                                                    player_name: 'S. Fletcher'),
                                    Feed::Event.new(id: '19525543',
                                                    match_id: '1952554',
                                                    event_type: 'yellowcard',
                                                    minute: '63',
                                                    team: 'visitorteam',
                                                    player_name: 'W. Buckley')] }

        let(:events_fixture_two) { [] }

        let(:feed_fixtures) { [double(Feed::Fixture, id: 111,
                                      home_team_id: 1,
                                      away_team_id: 2,
                                      home_team_goals: 3,
                                      away_team_goals: 2,
                                      finished?: fixtures_finished,
                                      events: events_fixture_one),
                               double(Feed::Fixture, id: 222,
                                      home_team_id: 2,
                                      away_team_id: 1,
                                      home_team_goals: 0,
                                      away_team_goals: 2,
                                      finished?: fixtures_finished,
                                      events: events_fixture_two)] }

        let!(:home_team) { Team.create(id: 1, name: 'argentina', abbreviation: 'arg') }
        let!(:away_team) { Team.create(id: 2, name: 'brazil', abbreviation: 'bra') }
        let!(:week_one) { Week.create(id: 1, close_date: 30.minutes.ago, description: 'Week 01') }
        let!(:week_two) { Week.create(id: 2, close_date: 15.minutes.ago, description: 'Week 02') }
        let!(:fixture_one) { Fixture.create(week_id: week_one.id, external_id: 111, home_team_id: home_team.id, away_team_id: away_team.id, name: 'ARG-BRA', kickoff: 1.days.from_now) }
        let!(:fixture_two) { Fixture.create(week_id: week_two.id, external_id: 222, home_team_id: away_team.id, away_team_id: home_team.id, name: 'BRA-ARG', kickoff: 2.days.from_now) }

        before :each do
          sync_scores.stub(:fixtures_from_feed).and_return(feed_fixtures)
        end

        context 'when retrieving scores for a specific date' do
          let(:date) { Date.today }

          context 'and there are no fixtures that have recently finished' do
            let(:recently_finished) { [] }
            let(:fixtures_finished) { false }

            it 'does not check whether fixtures have recently finished' do
              expect(Fixture).to_not have_received(:recently_finished)
            end

            it 'still attempts to fetch fixtures from feed' do
              sync_scores.perform date
              expect(sync_scores).to have_received(:fixtures_from_feed)
            end

            it 'does not return any weeks' do
              expect(sync_scores.perform).to eq([])
            end

          end
        end

        context 'when not retrieving scores for a specific date' do
          let(:date) { nil }
          let(:recently_finished) { ['some_fixtures'] }

          before :each do
            Fixture.stub(:recently_finished).and_return(recently_finished)
          end

          it 'checks whether fixtures have recently finished' do
            sync_scores.perform date
            expect(Fixture).to have_received(:recently_finished)
          end

          context 'and there are no fixtures that should have recently finished' do
            let(:recently_finished) { [] }

            it 'does not return any weeks' do
              expect(sync_scores.perform).to eq([])
            end

            it 'does not retrieve feed fixtures' do
              sync_scores.perform date
              expect(sync_scores).to_not have_received(:fixtures_from_feed)
            end
          end

          context 'and there are fixtures that should have recently finished' do

            context 'but they have not finished' do

              before :each do
                sync_scores.perform date
              end

              let(:fixtures_finished) { false }

              it 'does not attempt to find fixture to sync' do
                expect(Fixture).to_not have_received(:find_by_external_id)
              end

              it 'does not attempt to run markings' do
                expect(sync_scores).to_not have_received(:run_marking)
              end

              it 'does not attempt to sync standings' do
                expect(sync_scores).to_not have_received(:sync_standings)
              end

            end

            context 'and they have finished' do

              context 'and score and events exist' do

                before :each do
                  fixture_one.create_score(fixture_id: fixture_one.id, home: 0, away: 0)
                  fixture_one.events << [Event.create(external_id: 19525543, event_type: 'hand ball', player_name: 'D. Maradona', team: 'hometeam', minute: 45),
                                         Event.create(external_id: 19525541, event_type: 'own goal', player_name: 'S. Aguero', team: 'hometeam', minute: 10)]
                  sync_scores.perform date
                end

                it 'retrieves feed fixtures' do
                  expect(sync_scores).to have_received(:fixtures_from_feed)
                end

                it 'updates the score for fixture' do
                  expect(Fixture.find(fixture_one.id).score.home).to eq(3)
                  expect(Fixture.find(fixture_one.id).score.away).to eq(2)
                end

                it 'updates the events for fixture' do
                  expect(Fixture.find(fixture_one.id).events.collect(&:event_type)) =~ ['yellowcard', 'goal']
                  expect(Fixture.find(fixture_one.id).events.collect(&:player_name)) =~ ['W. Buckley', 'S. Fletcher']

                  expect(Fixture.find(fixture_two.id).events.collect(&:event_type)).to be_empty
                  expect(Fixture.find(fixture_two.id).events.collect(&:player_name)).to be_empty
                end

                it 'returns expected weeks' do
                  expect(sync_scores.perform).to eq([week_one,week_two])
                end

              end

              context 'and no score or events exists' do

                before :each do
                  sync_scores.perform date
                end

                it 'retrieves feed fixtures' do
                  expect(sync_scores).to have_received(:fixtures_from_feed)
                end

                it 'creates a new score for fixture' do
                  expect(Fixture.find(fixture_one.id).score.home).to eq(3)
                  expect(Fixture.find(fixture_one.id).score.away).to eq(2)
                end

                it 'creates new events for fixture' do
                  expect(Fixture.find(fixture_one.id).events.collect(&:event_type)) =~ ['yellowcard', 'goal']
                  expect(Fixture.find(fixture_one.id).events.collect(&:player_name)) =~ ['W. Buckley', 'S. Fletcher']

                  expect(Fixture.find(fixture_two.id).events.collect(&:event_type)).to be_empty
                  expect(Fixture.find(fixture_two.id).events.collect(&:player_name)).to be_empty
                end

              end
            end
          end
        end
      end
    end
  end
end
