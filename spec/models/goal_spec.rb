require 'spec_helper'

describe Goal do

  describe 'associations' do
    it { should belong_to :score }
    it { should belong_to :player }
  end

  describe 'attributes' do
    it { should respond_to(:id) }
    it { should respond_to(:player_id) }
    it { should respond_to(:score_id) }
  end

  describe 'scopes' do

    describe 'all_player_grouped_total_ordered' do
      let(:expected_sql) { "SELECT player_id, count(*) as count FROM \"goals\" GROUP BY \"goals\".\"player_id\" ORDER BY count desc" }

      it 'returns expected sql' do
        expect(Goal.all_player_grouped_total_ordered.to_sql).to eq(expected_sql)
      end
    end
  end

  describe 'instance methods' do

    describe '#opposing_team' do
      let!(:home_team) { Team.create(id: 1, name: 'Brazil') }
      let!(:away_team) { Team.create(id: 2, name: 'Argentina') }
      let!(:fixture) { Fixture.create(id: 1, home_team_id: home_team.id, away_team_id: away_team.id) }
      let!(:score)   { Score.create(id: 1, fixture_id: fixture.id, home: 1, away: 1) }
      let!(:goal) { Goal.create(player_id: scorer.id, score_id: 1) }

      context 'when a home team player scores' do
        let!(:scorer)  { Player.create(id: 1, surname: 'Pele', team_id: home_team.id) }

        it 'returns the away team as the opposition' do
          expect(goal.opposing_team).to eq away_team
        end
      end

      context 'when an away team player scores' do
        let!(:scorer)  { Player.create(id: 2, surname: 'Maradona', team_id: away_team.id) }

        it 'returns the home team as the opposition' do
          expect(goal.opposing_team).to eq home_team
        end
      end
    end
  end
end
