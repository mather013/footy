require 'spec_helper'

module Feed
  module FootballApi
    describe Fixture do
      let(:status) { 'FT' }
      let(:fixture) { Feed::FootballApi::Fixture.new(hash) }
      let(:hash) { {:id => '1952554',
                    :comp_id => '1204',
                    :formatted_date => '03.11.2014',
                    :week => '26',
                    :venue_beta => '',
                    :venue_id_beta => '0',
                    :venue_city_beta => '',
                    :status => status,
                    :timer => '',
                    :time => '20:00',
                    :localteam_id => '9127',
                    :localteam_name => 'Crystal Palace',
                    :localteam_score => '1',
                    :visitorteam_id => '9384',
                    :visitorteam_name => 'Sunderland',
                    :visitorteam_score => '3',
                    :ht_score => '[0-1]',
                    :ft_score => '[1-3]',
                    :et_score => '',
                    :penalty_local => '',
                    :penalty_visitor => '',
                    :events =>
                        [{:id => '19525541',
                          :type => 'goal',
                          :minute => '31',
                          :extra_min => '',
                          :team => 'visitorteam',
                          :player => 'S. Fletcher',
                          :player_id => '890',
                          :assist => 'something',
                          :assist_id => '891',
                          :result => '[0 - 1]'},
                         {:id => '19525543',
                          :match_id => '1952554',
                          :type => 'yellowcard',
                          :minute => '63',
                          :extra_min => '',
                          :team => 'visitorteam',
                          :player => 'W. Buckley',
                          :player_id => '50726',
                          :assist => 'something',
                          :assist_id => '891',
                          :result => ''}]} }

      describe 'attributes' do
        it 'has the expected values' do
          expect(fixture.id).to eq(1952554)
          expect(fixture.home_team_id).to eq(9127)
          expect(fixture.away_team_id).to eq(9384)
          expect(fixture.score).to eq('[1-3]')
          expect(fixture.home_team_goals).to eq(1)
          expect(fixture.away_team_goals).to eq(3)
          expect(fixture.status).to eq('FT')
        end
      end

      describe 'instance methods' do

        describe '#finished?' do

          context 'when fixture has a status of full time' do
            it 'returns true' do
              expect(fixture.finished?).to be_truthy
            end
          end

          context 'when fixture does not have a status of full time' do
            let(:status) { 'HT' }
            it 'returns false' do
              expect(fixture.finished?).to be_falsey
            end
          end
        end

        describe '#kickoff' do
          it 'returns the fixture kickoff time in expected format' do
            expect(fixture.kickoff).to eq(DateTime.parse('2014-11-03 20:00'))
          end
        end
      end
    end
  end
end
