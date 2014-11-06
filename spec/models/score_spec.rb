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

  describe 'mass assignment' do
    [:id, :fixture_id, :home, :away].each do |attribute|
      it { should allow_mass_assignment_of(attribute) }
    end
  end

  describe 'validations' do

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
