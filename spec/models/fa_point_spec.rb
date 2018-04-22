require 'spec_helper'

describe FaPoint do

  describe 'attributes' do
    it { should respond_to(:id) }
    it { should respond_to(:user_id) }
    it { should respond_to(:value) }
  end

  describe 'total_points' do
    let(:user_1) { User.create(name: 'M Mather', username: 'mark', password: 'abc') }
    let(:user_2) { User.create(name: 'D Mather', username: 'david', password: 'def') }
    let(:user_3) { User.create(name: 'L Mather', username: 'lucas', password: 'ghi') }

    before :each do
      user_1.create_fa_point(value: 10)
      user_2.create_fa_point(value: 30)
      user_3.create_fa_point(value: 90)
    end

    it 'returns all points by user' do
      total_points = FaPoint.total_points

      expect(total_points.to_a.count).to eq(3)
      expect(total_points[0].user_id).to eq(user_3.id)
      expect(total_points[0].value).to eq(90)

      expect(total_points[1].user_id).to eq(user_2.id)
      expect(total_points[1].value).to eq(30)

      expect(total_points[2].user_id).to eq(user_1.id)
      expect(total_points[2].value).to eq(10)
    end
  end

end
