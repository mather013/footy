require 'spec_helper'

module Feed
  module FootballDataApi

    describe Fixture do
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
                    :result => {:goalsHomeTeam => 1, :goalsAwayTeam => 1,
                                :halfTime => {:goalsHomeTeam => 0, :goalsAwayTeam => 0},
                                :extraTime => {:goalsHomeTeam => 2, :goalsAwayTeam => 2},
                                :penaltyShootout => {:goalsHomeTeam => 6, :goalsAwayTeam => 5}}} }

      describe 'attributes' do

        context 'fixture has finished' do
          let(:status) { Fixture::Status::FINISHED}

          it 'has the expected values' do
            expect(fixture.id).to eq(147075)
            expect(fixture.home_team_id).to eq(66)
            expect(fixture.away_team_id).to eq(73)
            expect(fixture.score).to eq('[1-1]')
            expect(fixture.ht_score).to eq('[0-0]')
            expect(fixture.et_score).to eq('[2-2]')
            expect(fixture.ps_score).to eq('[6-5]')
            expect(fixture.home_team_goals).to eq(1)
            expect(fixture.away_team_goals).to eq(1)
            expect(fixture.status).to eq(::Fixture::Status::FINISHED)
          end
        end

        context 'fixture has been postponed' do
          let(:status) { Fixture::Status::POSTPONED}

          it 'has the expected values' do
            expect(fixture.id).to eq(147075)
            expect(fixture.home_team_id).to eq(66)
            expect(fixture.away_team_id).to eq(73)
            expect(fixture.score).to eq('[1-1]')
            expect(fixture.ht_score).to eq('[0-0]')
            expect(fixture.et_score).to eq('[2-2]')
            expect(fixture.ps_score).to eq('[6-5]')
            expect(fixture.home_team_goals).to eq(1)
            expect(fixture.away_team_goals).to eq(1)
            expect(fixture.status).to eq(::Fixture::Status::POSTPONED)
          end
        end

        context 'fixture has been timed' do
          let(:status) { Fixture::Status::TIMED}

          it 'has the expected values' do
            expect(fixture.id).to eq(147075)
            expect(fixture.home_team_id).to eq(66)
            expect(fixture.away_team_id).to eq(73)
            expect(fixture.score).to eq('[1-1]')
            expect(fixture.ht_score).to eq('[0-0]')
            expect(fixture.et_score).to eq('[2-2]')
            expect(fixture.ps_score).to eq('[6-5]')
            expect(fixture.home_team_goals).to eq(1)
            expect(fixture.away_team_goals).to eq(1)
            expect(fixture.status).to eq(::Fixture::Status::SCHEDULED)
          end
        end

        context 'fixture is in play' do
          let(:status) { Fixture::Status::IN_PLAY}

          it 'has the expected values' do
            expect(fixture.id).to eq(147075)
            expect(fixture.home_team_id).to eq(66)
            expect(fixture.away_team_id).to eq(73)
            expect(fixture.score).to eq('[1-1]')
            expect(fixture.ht_score).to eq('[0-0]')
            expect(fixture.et_score).to eq('[2-2]')
            expect(fixture.ps_score).to eq('[6-5]')
            expect(fixture.home_team_goals).to eq(1)
            expect(fixture.away_team_goals).to eq(1)
            expect(fixture.status).to eq(::Fixture::Status::IN_PLAY)
          end
        end
      end

      describe 'instance methods' do
        let(:status) { Fixture::Status::FINISHED}

        describe '#finished?' do

          context 'when fixture has a status of full time' do

            it 'returns true' do
              expect(fixture.finished?).to be_truthy
            end
          end

          context 'when fixture does not have a status of full time' do
            let(:status) { Fixture::Status::TIMED }
            it 'returns false' do
              expect(fixture.finished?).to be_falsey
            end
          end

          context 'when fixture does not have a status of full time' do
            let(:status) { Fixture::Status::POSTPONED }
            it 'returns false' do
              expect(fixture.finished?).to be_falsey
            end
          end

          context 'when fixture does not have a status of full time' do
            let(:status) { Fixture::Status::IN_PLAY }
            it 'returns false' do
              expect(fixture.finished?).to be_falsey
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
