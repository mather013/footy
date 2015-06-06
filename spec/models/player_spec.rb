require 'spec_helper'

describe Player do

  describe 'associations' do
    it { should belong_to :team }
    it { should have_many :goals }
  end

  describe 'attributes' do
    it { should respond_to(:id) }
    it { should respond_to(:forename) }
    it { should respond_to(:surname) }
    it { should respond_to(:team_id) }
    it { should respond_to(:squad_number) }
  end

  describe 'mass assignment' do
    [:id, :forename, :surname, :team_id, :squad_number].each do |attribute|
      it { should allow_mass_assignment_of(attribute) }
    end
  end

  describe 'validation' do

    before :each do
      Player.create(forename: 'L', surname: 'Messi', team_id: 1)
    end

    context 'when player exists with this forename and surname' do
      it 'is an invalid player' do
        Player.new(forename: 'L', surname: 'Messi', team_id: 2).should_not be_valid
      end
    end

    context 'when player does not exist with this forename and surname' do
      it 'is a valid player' do
        Player.new(forename: 'R', surname: 'Messi', team_id: 2).should be_valid
      end
    end
  end

  describe 'instance methods' do
    let(:player) { Player.new(forename: 'Mark', surname: 'Mather', squad_number: 10, team_id: 1) }

    describe 'name' do
      it 'returns player forename and surname as string' do
        expect(player.name).to eq('Mark Mather')
      end
    end

    describe 'name_and_number' do
      it 'returns player forename, surname and squad number as string' do
        expect(player.name_and_number).to eq('Mark Mather #10')
      end
    end

  end

end
