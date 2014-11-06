require 'spec_helper'

describe FaPoint do

  describe 'attributes' do
    it { should respond_to(:id) }
    it { should respond_to(:user_id) }
    it { should respond_to(:value) }
  end

  describe 'mass assignment' do
    [:id, :user_id, :value].each do |attribute|
      it { should allow_mass_assignment_of(attribute) }
    end
  end
end
