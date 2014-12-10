require 'spec_helper'

module Jobs
  describe SyncScores do

    describe 'instance methods' do

      describe '#perform' do
        let(:sync_scores) { Jobs::SyncScores.new }
        let(:fixture_finished) { true }
        let(:feed_fixtures) { [double(Feed::Fixture, id: 999, home_team_id: 1, away_team_id: 2,
                                      home_team_goals:   3, away_team_goals: 2, finished?: fixture_finished)] }

        let!(:home_team) { Team.create(id:1, name: 'argentina', abbreviation: 'arg') }
        let!(:away_team) { Team.create(id:2, name: 'brazil', abbreviation: 'bra') }
        let!(:week) { Week.create(id: 1, close_date: 30.minutes.ago, description: 'Week 01') }
        let!(:fixture) { Fixture.create(week_id: week.id, external_id: 999, home_team_id: home_team.id, away_team_id: away_team.id, name: "ARG-BRA", kickoff: 1.day.from_now) }

        before :each do
          Fixture.stub(:recently_finished).and_return(recently_finished)

          sync_scores.stub(:required_week).and_return(week)
          sync_scores.stub(:run_marking)
          sync_scores.stub(:fixtures_from_feed).and_return(feed_fixtures)

          week.stub(:maybe_mark_complete)
        end

        context 'when forced to get fixtures' do
          let(:force) { true }

          context 'and there are no fixtures that have recently finished' do
            let(:recently_finished) { [] }
            let(:fixture_finished) { false }

            it 'still retrieves feed fixtures' do
              sync_scores.perform force
              sync_scores.should have_received(:fixtures_from_feed)
            end
          end
        end

        context 'when not forced to get fixtures' do

          context 'and there are no fixtures that have recently finished' do
            let(:recently_finished) { [] }

            it 'does not retrieve feed fixtures' do
              sync_scores.perform
              sync_scores.should_not have_received(:fixtures_from_feed)
            end
          end

          context 'and there are fixtures that have recently finished' do
            let(:recently_finished) { ['some_fixtures'] }

            context 'and fixture has not finished' do
              let(:fixture_finished) { false }

              it 'does not attempt to find fixture to sync' do
                sync_scores.perform
                Fixture.should_not have_received(:find_by_external_id)
              end

              it 'does not attempt to run markings' do
                sync_scores.should_not have_received(:run_marking)
              end

            end

            context 'and fixture has finished' do

              context 'and it already has a score recorded' do

                before :each do
                  Week.stub(:find).and_return(week)
                  fixture.create_score(fixture_id: fixture.id, home: 0, away: 0)
                  sync_scores.perform
                end

                it 'retrieves feed fixtures' do
                  sync_scores.should have_received(:fixtures_from_feed)
                end

                it 'updates the score from feed fixture' do
                  Fixture.find(fixture.id).score.home.should eq(3)
                  Fixture.find(fixture.id).score.away.should eq(2)
                end

                it 'attempts to run markings' do
                  sync_scores.should have_received(:run_marking)
                end

                it 'attempts to mark week complete' do
                  week.should have_received(:maybe_mark_complete)
                end

              end

              context 'and there is no score already recorded' do

                before :each do
                  sync_scores.perform
                end

                it 'retrieves feed fixtures' do
                  sync_scores.should have_received(:fixtures_from_feed)
                end

                it 'create a new score for fixture' do
                  Fixture.find(fixture.id).score.home.should eq(3)
                  Fixture.find(fixture.id).score.away.should eq(2)
                end

                it 'attempts to run markings' do
                  sync_scores.should have_received(:run_marking)
                end

              end
            end
          end
        end
      end
    end
  end
end
