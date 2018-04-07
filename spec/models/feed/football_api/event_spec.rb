require 'spec_helper'

module Feed
  module FootballApi
    describe Event do
      let(:event) { Feed::FootballApi::Event.new(hash) }
      let(:hash) { {:id => '19525541',
                    :match_id => '1952554',
                    :type => 'goal',
                    :minute => '31',
                    :team => 'visitorteam',
                    :player => 'S. Fletcher',
                    :player_id => '890',
                    :assist_id => '',
                    :assist => 'Tripping',
                    :extra_min=> '',
                    :result => '[0 - 1]'} }

      describe 'attributes' do
        it 'has the expected values' do
          expect(event.id).to eq(19525541)
          expect(event.event_type).to eq('goal')
          expect(event.minute).to eq(31)
          expect(event.player_name).to eq('S. Fletcher')
          expect(event.team).to eq('visitorteam')
          # expect(event.player_id).to eq(890)
          # expect(event.result).to eq('[0 - 1]')
        end
      end

      describe 'instance methods' do
        describe '#to_savable_hash' do
          it 'has the expected values' do
            expect(event.to_savable_hash).to eq ({'event_type' => 'goal',
                                                  'player_name' => 'S. Fletcher',
                                                  'team' => 'visitorteam',
                                                  'minute' => 31})
          end
        end
      end
    end
  end
end
