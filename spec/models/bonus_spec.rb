require 'spec_helper'

describe Bonus do

  describe 'association' do
    it { should belong_to :point }
  end

end
