require 'spec_helper'

describe Game do

  describe 'associations' do
    it { should have_and_belong_to_many :users }
  end

  describe 'attributes' do
    it { should respond_to(:id) }
    it { should respond_to(:name) }
    it { should respond_to(:description) }
  end

  describe 'mass assignment' do
    [:id, :name, :description].each do |attribute|
      it { should allow_mass_assignment_of(attribute) }
    end
  end
end
