require 'spec_helper'

describe Event do

  describe 'associations' do
    it { should belong_to :fixture }
    it { should belong_to :event_team }
  end

  describe 'attributes' do
    it { should respond_to(:id) }
    it { should respond_to(:event_type) }
    it { should respond_to(:team) }
    it { should respond_to(:player_name) }
    it { should respond_to(:minute) }
    it { should respond_to(:fixture_id) }
    it { should respond_to(:external_id) }
    it { should respond_to(:team_id) }
  end

end
