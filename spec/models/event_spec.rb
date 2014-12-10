require 'spec_helper'

describe Event do

  describe 'associations' do
    it { should belong_to :fixture }
  end

  describe 'attributes' do
    it { should respond_to(:id) }
    it { should respond_to(:type) }
    it { should respond_to(:team) }
    it { should respond_to(:player_name) }
    it { should respond_to(:minute) }
    it { should respond_to(:fixture_id) }
    it { should respond_to(:external_id) }
  end

  describe 'mass assignment' do
    [:id, :type, :team, :player_name, :minute, :fixture_id, :external_id].each do |attribute|
      it { should allow_mass_assignment_of(attribute) }
    end
  end
end
