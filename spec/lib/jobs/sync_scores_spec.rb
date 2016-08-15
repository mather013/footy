require 'spec_helper'

module Jobs
  describe SyncScores do

    describe 'instance methods' do
      let(:fixture_feed_service) { "Feed::#{TOGGLES_CONFIG['feed'].camelize.to_s}::Fixture".constantize }

      describe '#perform' do
        let(:team) { 'visitorteam' }
        let(:sync_scores) { Jobs::SyncScores.new }
        let(:fixtures_finished) { true }
        let(:events_fixture_one) { [Feed::FootballApi::Event.new(event_id: '19525541',
                                                                 event_match_id: '1952554',
                                                                 event_type: 'goal',
                                                                 event_minute: '31',
                                                                 event_team: team,
                                                                 event_player: 'S. Fletcher'),
                                    Feed::FootballApi::Event.new(event_id: '19525543',
                                                                 event_match_id: '1952554',
                                                                 event_type: 'yellowcard',
                                                                 event_minute: '63',
                                                                 event_team: team,
                                                                 event_player: 'W. Buckley')] }

        let(:events_fixture_two) { [] }

        let(:feed_fixtures) { [double(fixture_feed_service, id: 111,
                                      home_team_id: 1,
                                      away_team_id: 2,
                                      home_team_goals: 3,
                                      away_team_goals: 2,
                                      finished?: fixtures_finished,
                                      events: events_fixture_one,
                                      status: feed_fixture_status),
                               double(fixture_feed_service, id: 222,
                                      home_team_id: 2,
                                      away_team_id: 1,
                                      home_team_goals: 0,
                                      away_team_goals: 2,
                                      finished?: fixtures_finished,
                                      events: events_fixture_two,
                                      status: feed_fixture_status)] }

        let!(:home_team) { Team.create(id: 1, name: 'argentina', abbreviation: 'arg') }
        let!(:away_team) { Team.create(id: 2, name: 'brazil', abbreviation: 'bra') }
        let!(:week_one) { Week.create(id: 1, close_date: 30.minutes.ago, description: 'Week 01') }
        let!(:week_two) { Week.create(id: 2, close_date: 15.minutes.ago, description: 'Week 02') }
        let!(:fixture_one) { Fixture.create(week_id: week_one.id, external_id: 111, home_team_id: home_team.id, away_team_id: away_team.id, name: 'ARG-BRA', kickoff: 1.day.ago, status: 'scheduled') }
        let!(:fixture_two) { Fixture.create(week_id: week_two.id, external_id: 222, home_team_id: away_team.id, away_team_id: home_team.id, name: 'BRA-ARG', kickoff: 2.days.ago, status: 'scheduled') }

        before :each do
          sync_scores.stub(:fixtures_from_feed).and_return(feed_fixtures)
        end

        context 'when there are no fixtures that require scores' do
          let(:fixtures_requiring_scores) { [] }
          let(:feed_fixture_status) { ::Fixture::Status::FINISHED }

          it 'does not fetch fixtures from feed and does not return any weeks to mark' do
            Fixture.stub(:requiring_score).and_return(fixtures_requiring_scores)
            expect(sync_scores.perform).to eq([])
            expect(sync_scores).to_not have_received(:fixtures_from_feed)
          end
        end

        context 'when there are fixtures that require scores' do
          let(:fixtures_requiring_scores) { [fixture_one, fixture_two] }

          context 'and feed status is finished' do
            let(:feed_fixture_status) { ::Fixture::Status::FINISHED }

            it 'fetches fixtures from feed, using kickoff, update fixtures status and returns weeks to mark' do
              Fixture.stub(:requiring_score).and_return(fixtures_requiring_scores)
              expect(sync_scores.perform).to eq([week_one, week_two])
              expect(Fixture).to have_received(:requiring_score)
              expect(sync_scores).to have_received(:fixtures_from_feed).with(1.day.ago.to_date)
              expect(sync_scores).to have_received(:fixtures_from_feed).with(2.days.ago.to_date)

              expect(fixture_one.reload.status).to eq('finished')
              expect(fixture_one.score.home).to eq(3)
              expect(fixture_one.score.away).to eq(2)
              expect(fixture_two.reload.status).to eq('finished')
              expect(fixture_two.score.home).to eq(0)
              expect(fixture_two.score.away).to eq(2)
            end
          end

          context 'and feed status is not finished' do
            let(:fixtures_finished) { false }
            let(:feed_fixture_status) { ::Fixture::Status::IN_PLAY }

            it 'fetches fixtures from feed but does not update fixtures status nor return any weeks to mark' do
              Fixture.stub(:requiring_score).and_return(fixtures_requiring_scores)
              expect(sync_scores.perform).to eq([])
              expect(Fixture).to have_received(:requiring_score)
              expect(sync_scores).to have_received(:fixtures_from_feed).with(1.day.ago.to_date)
              expect(sync_scores).to have_received(:fixtures_from_feed).with(2.days.ago.to_date)

              expect(fixture_one.reload.status).to eq('scheduled')
              expect(fixture_one.score).to eq nil
              expect(fixture_two.reload.status).to eq('scheduled')
              expect(fixture_two.score).to eq nil
            end
          end

        end

        #context 'when not retrieving scores for a specific date' do
        #  let(:date) { nil }
        #  let(:requiring_score) { ['some_fixtures'] }
        #
        #  before :each do
        #    Fixture.stub(:requiring_score).and_return(requiring_score)
        #  end
        #
        #  it 'checks whether fixtures have recently finished' do
        #    sync_scores.perform date
        #    expect(Fixture).to have_received(:requiring_score)
        #  end
        #
        #  context 'and there are no fixtures that should have recently finished' do
        #    let(:requiring_score) { [] }
        #
        #    it 'does not return any weeks' do
        #      expect(sync_scores.perform).to eq([])
        #    end
        #
        #    it 'does not retrieve feed fixtures' do
        #      sync_scores.perform date
        #      expect(sync_scores).to_not have_received(:fixtures_from_feed)
        #    end
        #  end
        #
        #  context 'and there are fixtures that should have recently finished' do
        #
        #    context 'but they have not finished' do
        #
        #      before :each do
        #        sync_scores.perform date
        #      end
        #
        #      let(:fixtures_finished) { false }
        #
        #      it 'does not attempt to find fixture to sync' do
        #        expect(Fixture).to_not have_received(:find_by_external_id)
        #      end
        #
        #      it 'does not attempt to run markings' do
        #        expect(sync_scores).to_not have_received(:run_marking)
        #      end
        #
        #      it 'does not attempt to sync standings' do
        #        expect(sync_scores).to_not have_received(:sync_standings)
        #      end
        #
        #    end
        #
        #    context 'and they have finished' do
        #
        #      context 'and score and events exist' do
        #
        #        before :each do
        #          fixture_one.create_score(fixture_id: fixture_one.id, home: 0, away: 0)
        #          fixture_one.events << [Event.create(external_id: 19525543, event_type: 'hand ball', player_name: 'D. Maradona', team: 'hometeam', minute: 45),
        #                                 Event.create(external_id: 19525541, event_type: 'own goal', player_name: 'S. Aguero', team: 'hometeam', minute: 10)]
        #          sync_scores.perform date
        #        end
        #
        #        it 'retrieves feed fixtures' do
        #          expect(sync_scores).to have_received(:fixtures_from_feed)
        #        end
        #
        #        it 'updates the score for fixture' do
        #          score = Fixture.find(fixture_one.id).score
        #          expect(score.home).to eq(3)
        #          expect(score.away).to eq(2)
        #        end
        #
        #        it 'updates the events for fixture' do
        #          events = Fixture.find(fixture_one.id).events
        #          expect(events.collect(&:event_type)) =~ ['yellowcard', 'goal']
        #          expect(events.collect(&:player_name)) =~ ['W. Buckley', 'S. Fletcher']
        #
        #          expect(Fixture.find(fixture_two.id).events.count).to eq(0)
        #        end
        #
        #        it 'returns expected weeks' do
        #          expect(sync_scores.perform).to eq([week_one,week_two])
        #        end
        #
        #      end
        #
        #      context 'and no score or events exists' do
        #
        #        before :each do
        #          sync_scores.perform date
        #        end
        #
        #        it 'retrieves feed fixtures' do
        #          expect(sync_scores).to have_received(:fixtures_from_feed)
        #        end
        #
        #        it 'creates a new score for fixture' do
        #          score = Fixture.find(fixture_one.id).score
        #          expect(score.home).to eq(3)
        #          expect(score.away).to eq(2)
        #        end
        #
        #        context 'and it is for home team' do
        #          let(:team) { 'localteam' }
        #
        #          it 'creates new events for fixture' do
        #            events = Fixture.find(fixture_one.id).events
        #            expect(events.collect(&:event_type)) =~ ['yellowcard', 'goal']
        #            expect(events.collect(&:player_name)) =~ ['W. Buckley', 'S. Fletcher']
        #            expect(events.collect(&:event_team)).to eq([home_team,home_team])
        #
        #            expect(Fixture.find(fixture_two.id).events.count).to eq(0)
        #          end
        #        end
        #
        #        context 'and it is for away team' do
        #          it 'creates new events for fixture' do
        #            events = Fixture.find(fixture_one.id).events
        #            expect(events.count).to eq(2)
        #            expect(events.collect(&:event_type)) =~ ['yellowcard', 'goal']
        #            expect(events.collect(&:player_name)) =~ ['W. Buckley', 'S. Fletcher']
        #            expect(events.collect(&:event_team)).to eq([away_team,away_team])
        #
        #            expect(Fixture.find(fixture_two.id).events.count).to eq(0)
        #          end
        #        end
        #      end
        #    end
        #  end
        #end
      end
    end
  end
end
