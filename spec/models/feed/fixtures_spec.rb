require 'spec_helper'

module Feed
  describe Fixtures do
    let(:hash) { [{:id => '1952554',
                  :comp_id => '1204',
                  :formatted_date => '03.11.2014',
                  :week => '26',
                  :venue_beta => '',
                  :venue_id_beta => '0',
                  :venue_city_beta => '',
                  :status => 'finished',
                  :timer => '',
                  :time => '',
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
                        :result => ''}]}] }

    describe 'instance methods' do

      describe "#each" do
        before :each do
          stub_const("TOGGLES_CONFIG", { "feed" => 'football_api' })
          @fixtures =  Feed::Fixtures.new(hash).each
        end

        it 'should construct fixtures' do
          expect(@fixtures.count).to eq(1)
        end
      end
    end

  end
end
