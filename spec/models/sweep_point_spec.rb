require 'spec_helper'

describe SweepPoint do

  describe 'associations' do
    it { should belong_to :team }
  end

  describe 'attributes' do
    it { should respond_to(:id) }
    it { should respond_to(:team_id) }
    it { should respond_to(:value) }
  end

  describe 'mass assignment' do
    [:id, :team_id, :value].each do |attribute|
      it { should allow_mass_assignment_of(attribute) }
    end
  end

  describe 'scopes' do

    describe 'sorted' do

      it 'orders bets by id' do
        bet_one = SweepPoint.create(team_id: 10, value: 1)
        bet_two = SweepPoint.create(team_id: 20, value: 0)
        bet_three = SweepPoint.create(team_id: 30, value: 2)

        expect(SweepPoint.sorted).to eq [bet_three, bet_one, bet_two]
      end
    end
  end
end
