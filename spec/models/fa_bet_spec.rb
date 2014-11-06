require 'spec_helper'

describe FaBet do

  describe 'associations' do
    it { should belong_to :user }
    it { should belong_to :player }
  end

  describe 'attributes' do
    it { should respond_to(:id) }
    it { should respond_to(:user_id) }
    it { should respond_to(:player_id) }
  end

  describe 'mass assignment' do
    [:id, :user_id, :player_id].each do |attribute|
      it { should allow_mass_assignment_of(attribute) }
    end
  end
end
