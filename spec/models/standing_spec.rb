require 'spec_helper'

describe Standing do

  describe 'attributes' do
    it { should respond_to(:id) }
    it { should respond_to(:team_id) }
    it { should respond_to(:position) }
    it { should respond_to(:form) }
    it { should respond_to(:points) }
  end

  describe 'mass assignment' do
    [:id, :team_id, :position, :form, :points].each do |attribute|
      it { should allow_mass_assignment_of(attribute) }
    end
  end

  describe 'associations' do
    it { should belong_to :team }
  end

end
