require 'spec_helper'

module Feed
  module FootballDataApi

    describe Team do
      let(:team) { Feed::FootballDataApi::Team.new(hash) }

      let(:hash) {
        {:_links => {:team => {:href => "some_url/v1/teams/58"}},
         :position => 20,
         :teamName => "Aston Villa FC",
         :crestURI =>"some_url/Aston_Villa_logo.svg",
         :playedGames => 26,
         :points => 16,
         :goals => 20,
         :goalsAgainst => 46,
         :goalDifference => -26,
         :wins => 3,
         :draws => 7,
         :losses => 16,
         :home => {:goals => 10, :goalsAgainst => 20, :wins => 2, :draws => 4, :losses => 7},
         :away => {:goals => 10, :goalsAgainst => 26, :wins => 1, :draws => 3, :losses => 9}}
      }

      describe 'attributes' do
        it 'has the expected values' do
          expect(team.id).to eq(58)
          expect(team.position).to eq(20)
          expect(team.points).to eq(16)
          expect(team.form).to eq(nil)
          expect(team.name).to eq('Aston Villa FC')
          expect(team.form_score).to eq(0)
          expect(team.played).to eq(26)
          expect(team.goals).to eq({for: 20, against: 46, difference: -26})
        end
      end

    end
  end
end
