require 'spec_helper'

describe Player do

  describe 'associations' do
    it { should belong_to :team }
    it { should have_many :goals }
  end

  describe 'attributes' do
    it { should respond_to(:id) }
    it { should respond_to(:name) }
    it { should respond_to(:team_id) }
  end

  describe 'mass assignment' do
    [:id, :name, :team_id].each do |attribute|
      it { should allow_mass_assignment_of(attribute) }
    end
  end
end
