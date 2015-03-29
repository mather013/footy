require 'spec_helper'

module Jobs
  describe SyncScores do

    describe 'instance methods' do

      describe '#perform' do
        let(:sync_scores) { Jobs::SyncScores.new }
        let(:fixtures_finished) { true }
        let(:events_fixture_one) { [{ :event_id        => '19525541',
                                      :event_match_id  => '1952554',
                                      :event_type      => 'goal',
                                      :event_minute    => '31',
                                      :event_team      => 'visitorteam',
                                      :event_player    => 'S. Fletcher',
                                      :event_player_id => '890',
                                      :event_result    => '[0 - 1]' },
                                    { :event_id        => '19525543',
                                      :event_match_id  => '1952554',
                                      :event_type      => 'yellowcard',
                                      :event_minute    => '63',
                                      :event_team      => 'visitorteam',
                                      :event_player    => 'W. Buckley',
                                      :event_player_id => '50726',
                                      :event_result    => '' }] }

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

        let!(:home_team) { Team.create(id:1, name: 'argentina', abbreviation: 'arg') }
        let!(:away_team) { Team.create(id:2, name: 'brazil', abbreviation: 'bra') }
        let!(:week_one) { Week.create(id: 1, close_date: 30.minutes.ago, description: 'Week 01') }
        let!(:week_two) { Week.create(id: 2, close_date: 15.minutes.ago, description: 'Week 02') }
        let!(:fixture_one) { Fixture.create(week_id: week_one.id, external_id: 111, home_team_id: home_team.id, away_team_id: away_team.id, name: 'ARG-BRA', kickoff: 1.days.from_now) }
        let!(:fixture_two) { Fixture.create(week_id: week_two.id, external_id: 222, home_team_id: away_team.id, away_team_id: home_team.id, name: 'BRA-ARG', kickoff: 2.days.from_now) }

        before :each do
          sync_scores.stub(:fixtures_from_feed).and_return(feed_fixtures)
        end

        context 'when forced to get fixtures' do
          let(:force) { true }

          context 'and there are no fixtures that have recently finished' do
            let(:recently_finished) { [] }
            let(:fixtures_finished) { false }

            it 'still attempts to fetch fixtures from feed' do
              sync_scores.perform force
              expect(sync_scores).to have_received(:fixtures_from_feed)
            end
          end
        end

        context 'when not forced to get fixtures' do

          context 'and there are no fixtures that have recently finished' do
            let(:recently_finished) { [] }

            it 'does not retrieve feed fixtures' do
              sync_scores.perform
              expect(sync_scores).to_not have_received(:fixtures_from_feed)
            end
          end

          context 'and there are fixtures that have recently finished' do
            let(:recently_finished) { ['some_fixtures'] }

            before :each do
              week_one.stub(:maybe_mark_complete)
              week_two.stub(:maybe_mark_complete)

              sync_scores.stub(:run_marking)
              sync_scores.stub(:sync_standings)
            end

            context 'and the fixtures have not finished' do

              before :each do
                sync_scores.perform
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

            context 'and fixtures has finished' do

              before :each do
                Fixture.stub(:find_by_external_id).with(111).and_return(fixture_one)
                Fixture.stub(:find_by_external_id).with(222).and_return(fixture_two)
                Fixture.stub(:recently_finished).and_return(recently_finished)

                fixture_one.stub(:week).and_return(week_one)
                fixture_two.stub(:week).and_return(week_two)

                sync_scores.stub(:required_weeks).and_return([week_one,week_two])
              end

              context 'and already has a score and events recorded' do

                before :each do
                  fixture_one.create_score(fixture_id: fixture_one.id, home: 0, away: 0)
                  fixture_one.events << [Event.create(external_id: 19525543, event_type: 'hand ball', player_name: 'D. Maradona', team: 'hometeam', minute: 45),
                                         Event.create(external_id: 19525541, event_type: 'own goal', player_name: 'S. Aguero', team: 'hometeam', minute: 10)]
                  sync_scores.perform
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

                it 'attempts to run markings for each week' do
                  expect(sync_scores).to have_received(:run_marking).with(week_one)
                  expect(sync_scores).to have_received(:run_marking).with(week_two)
                end

                it 'attempts to mark week complete' do
                  expect(week_one).to have_received(:maybe_mark_complete)
                  expect(week_two).to have_received(:maybe_mark_complete)
                end

                it 'attempts to sync standings' do
                  expect(sync_scores).to have_received(:sync_standings)
                end

              end

              context 'and there is no score already recorded' do

                before :each do
                  sync_scores.perform
                end

                it 'retrieves feed fixtures' do
                  expect(sync_scores).to have_received(:fixtures_from_feed)
                end

                it 'create a new score for fixture' do
                  expect(Fixture.find(fixture_one.id).score.home).to eq(3)
                  expect(Fixture.find(fixture_one.id).score.away).to eq(2)
                end

                it 'create a new events for fixture' do
                  expect(Fixture.find(fixture_one.id).events.collect(&:event_type)) =~ ['yellowcard', 'goal']
                  expect(Fixture.find(fixture_one.id).events.collect(&:player_name)) =~ ['W. Buckley', 'S. Fletcher']

                  expect(Fixture.find(fixture_two.id).events.collect(&:event_type)).to be_empty
                  expect(Fixture.find(fixture_two.id).events.collect(&:player_name)).to be_empty
                end

                it 'attempts to run markings' do
                  expect(sync_scores).to have_received(:run_marking).with(week_one)
                  expect(sync_scores).to have_received(:run_marking).with(week_two)
                end

                it 'attempts to mark week complete' do
                  expect(week_one).to have_received(:maybe_mark_complete)
                  expect(week_two).to have_received(:maybe_mark_complete)
                end

                it 'attempts to sync standings' do
                  expect(sync_scores).to have_received(:sync_standings)
                end

              end
            end
          end
        end
      end
    end
  end
end
