require 'spec_helper'

module Jobs
  describe SyncStandings do

    describe 'instance methods' do

      describe '#perform' do
        let(:sync_standings) { Jobs::SyncStandings.new }
        let(:feed_standings) { [double(Feed::Team, id: 9002, position: 1, form: 'WWWWW', form_score: 15, points: 30),
                                double(Feed::Team, id: 9008, position: 2, form: 'WWWWL', form_score: 12, points: 27),
                                double(Feed::Team, id: 9072, position: 3, form: 'WWWLL', form_score: 9, points: 24)] }

        before :each do
          Standing.stub(:delete_all)
          sync_standings.stub(:standings_from_feed).and_return(feed_standings)
        end

        context 'when teams exists' do

          before :each do
            Team.create(external_id: 9002, abbreviation: 'ars', name: 'Arsenal')
            Team.create(external_id: 9008, abbreviation: 'ast', name: 'Aston Villa')
            Team.create(external_id: 9072, abbreviation: 'bur', name: 'Burnley')
            sync_standings.perform
          end

          it 'removes all existing standings records' do
            Standing.should have_received(:delete_all)
          end

          it 'attempts to retrieve standings from feed' do
            sync_standings.should have_received(:standings_from_feed)
          end

          it 'creates new standings records from feed' do
            Standing.count.should eq(3)
          end

        end

        context 'when teams do not exists' do

          before :each do
            sync_standings.perform
          end

          it 'does not create new standings records from feed' do
            Standing.count.should eq(0)
          end

        end

      end
    end
  end
end
