require 'spec_helper'

module Feed
  describe Fixtures do
    let(:hash) { [{ :match_id                   => "1952554",
                    :match_static_id            => "1755666",
                    :match_comp_id              => "1204",
                    :match_date                 => "Nov 03",
                    :match_formatted_date       => "03.11.2014",
                    :match_season_beta          => "",
                    :match_week_beta            => "",
                    :match_venue_beta           => "",
                    :match_venue_id_beta        => "0",
                    :match_venue_city_beta      => "",
                    :match_status               => "FT",
                    :match_timer                => "",
                    :match_time                 => "20:00",
                    :match_commentary_available => "",
                    :match_localteam_id         => "9127",
                    :match_localteam_name       => "Crystal Palace",
                    :match_localteam_score      => "1",
                    :match_visitorteam_id       => "9384",
                    :match_visitorteam_name     => "Sunderland",
                    :match_visitorteam_score    => "3",
                    :match_ht_score             => "[0-1]",
                    :match_ft_score             => "[1-3]",
                    :match_et_score             => "",
                    :match_events               =>
                        [{ :event_id        => "19525541",
                           :event_match_id  => "1952554",
                           :event_type      => "goal",
                           :event_minute    => "31",
                           :event_team      => "visitorteam",
                           :event_player    => "S. Fletcher",
                           :event_player_id => "890",
                           :event_result    => "[0 - 1]" },
                         { :event_id        => "19525543",
                           :event_match_id  => "1952554",
                           :event_type      => "yellowcard",
                           :event_minute    => "63",
                           :event_team      => "visitorteam",
                           :event_player    => "W. Buckley",
                           :event_player_id => "50726",
                           :event_result    => "" }] }] }

    describe 'instance methods' do

      describe "#each" do
        before :each do
          @fixtures =  Feed::Fixtures.new(hash).each
        end

        it 'should construct fixtures' do
          expect(@fixtures.count).to eq(1)
        end
      end
    end

  end
end
