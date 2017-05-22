require 'spec_helper'

describe Position do

  describe 'attributes' do
    it { should respond_to(:id) }
    it { should respond_to(:user_id) }
    it { should respond_to(:current) }
    it { should respond_to(:previous) }
    it { should respond_to(:last_marked_week_id) }
  end

  describe 'associations' do
    it { should belong_to :user }
  end

  describe 'instance methods' do

    describe '#movement' do
      let(:first_to_second) {Position.create(id: 1, user_id: 1, current: 2, previous: 1, last_marked_week_id: 1)}
      let(:second_to_first) {Position.create(id: 2, user_id: 2, current: 1, previous: 2, last_marked_week_id: 1)}
      let(:third_no_change) {Position.create(id: 3, user_id: 3, current: 3, previous: 3, last_marked_week_id: 1)}

      it "returns 'none' for no change of position" do
        expect(third_no_change.movement).to eq("none")
      end

      it "returns 'up' for reaching a higher position" do
        expect(second_to_first.movement).to eq("up")
      end

      it "returns 'down' for reaching a lower position" do
        expect(first_to_second.movement).to eq("down")
      end

    end
  end
end
