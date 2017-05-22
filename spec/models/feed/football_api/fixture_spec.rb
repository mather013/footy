require 'spec_helper'

module Feed
  module FootballApi
    describe Fixture do
      let(:status) { 'FT' }
      let(:fixture) { Feed::FootballApi::Fixture.new(hash) }
      let(:hash) { {:match_id => "1952554",
                    :match_static_id => "1755666",
                    :match_comp_id => "1204",
                    :match_date => "Nov 03",
                    :match_formatted_date => "03.11.2014",
                    :match_season_beta => "",
                    :match_week_beta => "",
                    :match_venue_beta => "",
                    :match_venue_id_beta => "0",
                    :match_venue_city_beta => "",
                    :match_status => status,
                    :match_timer => "",
                    :match_time => "20:00",
                    :match_commentary_available => "",
                    :match_localteam_id => "9127",
                    :match_localteam_name => "Crystal Palace",
                    :match_localteam_score => "1",
                    :match_visitorteam_id => "9384",
                    :match_visitorteam_name => "Sunderland",
                    :match_visitorteam_score => "3",
                    :match_ht_score => "[0-1]",
                    :match_ft_score => "[1-3]",
                    :match_et_score => "",
                    :match_events =>
                        [{:event_id => "19525541",
                          :event_match_id => "1952554",
                          :event_type => "goal",
                          :event_minute => "31",
                          :event_team => "visitorteam",
                          :event_player => "S. Fletcher",
                          :event_player_id => "890",
                          :event_result => "[0 - 1]"},
                         {:event_id => "19525543",
                          :event_match_id => "1952554",
                          :event_type => "yellowcard",
                          :event_minute => "63",
                          :event_team => "visitorteam",
                          :event_player => "W. Buckley",
                          :event_player_id => "50726",
                          :event_result => ""}]} }

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
