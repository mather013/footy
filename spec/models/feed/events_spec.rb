require 'spec_helper'

module Feed
  describe Events do
    let(:hash) { [{ :event_id        => "19525541",
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
                           :event_result    => "" }] }

    describe 'instance methods' do

      describe "#each" do
        before :each do
          @events =  Feed::Events.new(hash).each
        end

        it 'should construct events' do
          expect(@events.count).to eq(2)
        end
      end
    end

  end
end
