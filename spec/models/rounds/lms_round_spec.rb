require 'spec_helper'

describe Rounds::LmsRound do

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
      let!(:lm_round_one) { Rounds::LmsRound.create(id: 1, week_id: 4) }
      let!(:lm_round_two) { Rounds::LmsRound.create(id: 2, week_id: 5) }
      let!(:lm_round_three) { Rounds::LmsRound.create(id: 3, week_id: 6) }

      it 'rounds ascending' do
        Rounds::LmsRound.sorted.should eq [lm_round_one, lm_round_two, lm_round_three]
      end

      it 'creates the expected sql for rounds ascending' do
        expect(Rounds::LmsRound.sorted.to_sql.should == "SELECT \"lms_rounds\".* FROM \"lms_rounds\"  ORDER BY week_id ASC")
      end

    end
  end

  describe 'class method' do

    describe 'current' do
      let!(:lm_round_one) { Rounds::LmsRound.create(id: 1, week_id: 4) }
      let!(:lm_round_two) { Rounds::LmsRound.create(id: 2, week_id: 5) }
      let!(:lm_round_three) { Rounds::LmsRound.create(id: 3, week_id: 6) }

      it 'returns expected lm_round' do
        expect(Rounds::LmsRound.current).to eq lm_round_three
      end

    end
  end
end
