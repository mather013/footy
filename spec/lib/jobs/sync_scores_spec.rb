require 'spec_helper'

module Jobs
  describe SyncScores do

    describe 'instance methods' do

      describe '#perform' do
        let(:sync_scores) { Jobs::SyncScores.new }
        let(:fixture_finished) { true }
        let(:feed_fixtures) { [double(Feed::Fixture, id: 999, home_team_id: 1, away_team_id: 2,
                                      home_team_goals:   3, away_team_goals: 2, finished?: fixture_finished)] }
        let(:score) { double(Score, home: 1, away: 0) }
        let(:fixture) { double(Fixture, external_id: 999, score: score, name: "ARG-BRA") }

        before :each do
          Fixture.stub(:recently_finished).and_return(recently_finished)
          Fixture.stub(:find_by_external_id).and_return(fixture)

          sync_scores.stub(:fixtures_from_feed).and_return(feed_fixtures)
        end

        context 'when forced to get fixtures' do
          let(:force) { true }

          context 'and there are no fixtures that have recently finished' do
            let(:recently_finished) { [] }

            before :each do
              fixture.score.stub(:update_attributes).with(home: 3, away: 2)
              sync_scores.perform force
            end

            it 'still retrieves feed fixtures' do
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
            end

            context 'and fixture has finished' do

              context 'and it already has a score' do

                before :each do
                  fixture.score.stub(:update_attributes).with(home: 3, away: 2)
                sync_scores.perform
                end

                it 'retrieves feed fixtures' do
                  sync_scores.should have_received(:fixtures_from_feed)
                end

                it 'finds fixture to sync' do
                  Fixture.should have_received(:find_by_external_id)
                end

                it 'updates existing score for fixture' do
                  fixture.score.should have_received(:update_attributes).with(home: 3, away: 2)
                end

              end

              context 'and there is no score' do
                let(:score) { nil }

                before :each do
                  fixture.stub(:create_score).with(home: 3, away: 2)
                sync_scores.perform
                end

                it 'retrieves feed fixtures' do
                  sync_scores.should have_received(:fixtures_from_feed)
                end

                it 'finds fixture to sync' do
                  Fixture.should have_received(:find_by_external_id)
                end

                it 'create a new score for fixture' do
                  fixture.should have_received(:create_score).with(home: 3, away: 2)
                end

              end
            end
          end
        end
      end
    end
  end
end
