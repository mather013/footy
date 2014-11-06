require 'spec_helper'

describe LmRound do

  describe 'associations' do
    it { should belong_to :week }
  end

  describe 'attributes' do
    it { should respond_to(:id) }
    it { should respond_to(:week_id) }
  end

  describe 'mass assignment' do
    [:id, :week_id].each do |attribute|
      it { should allow_mass_assignment_of(attribute) }
    end
  end

  describe 'scopes' do

    describe 'sorted' do
      let!(:lm_round_one) { LmRound.create(id: 1, week_id: 4) }
      let!(:lm_round_two) { LmRound.create(id: 2, week_id: 5) }
      let!(:lm_round_three) { LmRound.create(id: 3, week_id: 6) }

      it 'rounds ascending' do
        LmRound.sorted.should eq [lm_round_one, lm_round_two, lm_round_three]
      end

      it 'creates the expected sql for rounds ascending' do
        expect(LmRound.sorted.to_sql.should == "SELECT \"lm_rounds\".* FROM \"lm_rounds\"  ORDER BY week_id ASC")
      end

    end
  end

  describe 'class method' do

    describe 'current' do
      let!(:lm_round_one) { LmRound.create(id: 1, week_id: 4) }
      let!(:lm_round_two) { LmRound.create(id: 2, week_id: 5) }
      let!(:lm_round_three) { LmRound.create(id: 3, week_id: 6) }

      it 'returns expected lm_round' do
        expect(LmRound.current).to eq lm_round_three
      end

    end
  end
end
