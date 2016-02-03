require 'spec_helper'

describe Team do

  describe 'attributes' do
    it { should respond_to(:id) }
    it { should respond_to(:name) }
    it { should respond_to(:abbreviation) }
    it { should respond_to(:external_id) }
  end

  describe 'mass assignment' do
    [:id, :name, :abbreviation, :external_id].each do |attribute|
      it { should allow_mass_assignment_of(attribute) }
    end
  end

  describe 'associations' do
    it { should have_one :standing }
    it { should have_many :players }
    it { should have_many :events }
  end

  describe 'scopes' do
    before :each do
      ['Colombia','TBA','Argentina','Brazil'].each { |team_name| Team.create(name: team_name)  }
    end

    describe 'sorted' do
      let(:expected_result) { ['Argentina','Brazil','Colombia'] }

      it 'returns ordered by team' do
        expect(Team.sorted.collect(&:name)).to eq(expected_result)
      end
    end
  end
end
