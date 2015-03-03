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
  end

end
