require 'spec_helper'

describe Score do

  describe 'associations' do
    it { should belong_to :fixture }
    it { should have_many :goals }
  end

  describe 'attributes' do
    it { should respond_to(:id) }
    it { should respond_to(:fixture_id) }
    it { should respond_to(:home) }
    it { should respond_to(:away) }
  end

  describe 'validations' do

    context 'when score already belongs to a fixture' do
      let!(:score_1) { Score.create(id: 1, fixture_id: 1, home: 1, away: 0) }

      it 'is invalid' do
        expect(Score.new(fixture_id: 1, home: 2, away: 0)).to_not be_valid
      end
    end
  end

  describe 'instance methods' do

    describe '#outcome' do

      context 'when home team wins' do
        let(:score) { Score.create(fixture_id: 1, home: 1, away: 0) }
        subject { score.outcome }
        it { should == 'H' }
      end

      context 'when away team wins' do
        let(:score) { Score.create(fixture_id: 1, home: 0, away: 1) }
        subject { score.outcome }
        it { should == 'A' }
      end

      context 'when it is a draw' do
        let(:score) { Score.create(fixture_id: 1, home: 1, away: 1) }
        subject { score.outcome }
        it { should == 'D' }
      end

    end
  end
end
