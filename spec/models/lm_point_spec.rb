require 'spec_helper'

describe LmPoint do

  describe 'attributes' do
    it { should respond_to(:id) }
    it { should respond_to(:user_id) }
    it { should respond_to(:value) }
  end

end
