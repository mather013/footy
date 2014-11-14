require 'spec_helper'

module Feed
  describe FixturesController do

    let(:response) { [{ "match_id"                   => "1952554",
                              "match_static_id"            => "1755666",
                              "match_comp_id"              => "1204",
                              "match_date"                 => "Nov 03",
                              "match_formatted_date"       => "03.11.2014",
                              "match_season_beta"          => "",
                              "match_week_beta"            => "",
                              "match_venue_beta"           => "",
                              "match_venue_id_beta"        => "0",
                              "match_venue_city_beta"      => "",
                              "match_status"               => "FT",
                              "match_timer"                => "",
                              "match_time"                 => "20:00",
                              "match_commentary_available" => "",
                              "match_localteam_id"         => "9127",
                              "match_localteam_name"       => "Crystal Palace",
                              "match_localteam_score"      => "1",
                              "match_visitorteam_id"       => "9384",
                              "match_visitorteam_name"     => "Sunderland",
                              "match_visitorteam_score"    => "3",
                              "match_ht_score"             => "[0-1]",
                              "match_ft_score"             => "[1-3]",
                              "match_et_score"             => "",
                              "match_events"               =>
                                  [{ "event_id"        => "19525541",
                                     "event_match_id"  => "1952554",
                                     "event_type"      => "goal",
                                     "event_minute"    => "31",
                                     "event_team"      => "visitorteam",
                                     "event_player"    => "S. Fletcher",
                                     "event_player_id" => "890",
                                     "event_result"    => "[0 - 1]" },
                                   { "event_id"        => "19525543",
                                     "event_match_id"  => "1952554",
                                     "event_type"      => "yellowcard",
                                     "event_minute"    => "63",
                                     "event_team"      => "visitorteam",
                                     "event_player"    => "W. Buckley",
                                     "event_player_id" => "50726",
                                     "event_result"    => "" }] }.with_indifferent_access] }

    describe 'instance methods' do
      let(:controller) { FixturesController.new }
      let(:fixtures) { [ double(Fixture) ] }

      describe '#get_fixtures_for' do
        let(:url) { "http://football-api.com/api/?Action=fixtures&APIKey=23874509-922b-abe2-847ab13dadba&comp_id=1204&match_date=03.11.2014" }
        let(:date) { DateTime.parse('2014-11-03 20:00') }

        before :each do
          controller.stub(:send_request).with(url).and_return(response)
          Feed::Fixtures.stub(:new).and_return(fixtures)
        end

        it 'returns the expected fixtures' do
          expect(controller.get_fixtures_for(date)).to eq(fixtures)
        end

      end

      describe '#get_fixtures_between' do
        let(:url) { "http://football-api.com/api/?Action=fixtures&APIKey=23874509-922b-abe2-847ab13dadba&comp_id=1204&from_date=03.11.2014&to_date=10.11.2014" }
        let(:from_date) { DateTime.parse('2014-11-03 20:00') }
        let(:to_date) { DateTime.parse('2014-11-10 20:00') }

        before :each do
          controller.stub(:send_request).with(url).and_return(response)
          Feed::Fixtures.stub(:new).and_return(fixtures)
        end

        it 'returns the expected fixtures' do
          expect(controller.get_fixtures_between(from_date,to_date)).to eq(fixtures)
        end

      end

    end
  end
end
