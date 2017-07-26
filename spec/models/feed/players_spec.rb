require 'spec_helper'

module Feed
  describe Players do
    let(:hash) { [{:position => 'Keeper',
                   :name => 'Simon Mignolet',
                   :jerseyNumber => '22',
                   :dateOfBirth => '1988-03-06',
                   :nationality => 'Belgium',
                   :contractUntil => '2021-06-30',
                   :marketValue => nil}] }

    describe 'instance methods' do

      describe "#each" do
        before :each do
          stub_const("TOGGLES_CONFIG", {"feed" => 'football_data_api'})
          @players = Feed::Players.new(hash).each
        end

        it 'should construct players' do
          expect(@players.count).to eq(1)
        end
      end
    end

  end
end
