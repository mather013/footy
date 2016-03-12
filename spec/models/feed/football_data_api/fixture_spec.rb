require 'spec_helper'

module Feed
  module FootballDataApi

    describe Fixture do
      let(:status) { "FINISHED" }
      let(:fixture) { Feed::FootballDataApi::Fixture.new(hash) }
      let(:hash) { {:_links =>
                        {:self => {:href => "some_url/v1/fixtures/147075"},
                         :soccerseason => {:href => "some_url/v1/soccerseasons/398"},
                         :homeTeam => {:href => "some_url/v1/teams/66"},
                         :awayTeam => {:href => "some_url/v1/teams/73"}},
                    :date => "2015-08-08T11:45:00Z",
                    :status => status,
                    :matchday => 1,
                    :homeTeamName => "Manchester United FC",
                    :awayTeamName => "Tottenham Hotspur FC",
                    :result => {:goalsHomeTeam => 1, :goalsAwayTeam => 0}} }

      describe 'attributes' do
        it 'has the expected values' do
          expect(fixture.id).to eq(147075)
          expect(fixture.home_team_id).to eq(66)
          expect(fixture.away_team_id).to eq(73)
          expect(fixture.score).to eq('[1-0]')
          expect(fixture.home_team_goals).to eq(1)
          expect(fixture.away_team_goals).to eq(0)
          expect(fixture.status).to eq('FINISHED')
        end
      end

      describe 'instance methods' do

        describe '#finished?' do

          context 'when fixture has a status of full time' do
            it 'returns true' do
              expect(fixture.finished?).to be_true
            end
          end

          context 'when fixture does not have a status of full time' do
            let(:status) { "TIMED" }
            it 'returns false' do
              expect(fixture.finished?).to be_false
            end
          end
        end

        describe '#kickoff' do
          it 'returns the fixture kickoff time in expected format' do
            expect(fixture.kickoff).to eq(DateTime.parse('2015-08-08 11:45'))
          end
        end
      end
    end
  end
end
