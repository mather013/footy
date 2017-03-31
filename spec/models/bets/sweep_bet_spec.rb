require 'spec_helper'

describe Bets::SweepBet do

  describe 'associations' do
    it { should belong_to :user }
    it { should belong_to :team }
  end

  describe 'attributes' do
    it { should respond_to(:id) }
    it { should respond_to(:user_id) }
    it { should respond_to(:team_id) }
  end

  describe 'mass assignment' do
    [:id, :user_id, :team_id].each do |attribute|
      it { should allow_mass_assignment_of(attribute) }
    end
  end

  describe 'validations' do

    context 'when user has already has a sweep bet' do
      it 'is an invalid bet' do
        Bets::SweepBet.create(user_id: 1, team_id: 1)
        Bets::SweepBet.new(user_id: 1, team_id: 2).should_not be_valid
      end
    end
  end

  describe 'scopes' do

    describe 'sorted' do

      it 'orders bets by id' do
        bet_one = Bets::SweepBet.create(id: 1, user_id: 11, team_id: 10)
        bet_two = Bets::SweepBet.create(id: 2, user_id: 12, team_id: 20)
        bet_three = Bets::SweepBet.create(id: 3, user_id: 13, team_id: 30)

        expect(Bets::SweepBet.sorted).to eq [bet_one, bet_two, bet_three]
      end
    end
  end
end
