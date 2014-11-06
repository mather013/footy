require 'spec_helper'

describe Point do

  describe 'scopes' do
    let!(:point_one)   { Point.create(week_id: 1, user_id: 1, value: 10) }
    let!(:point_two)   { Point.create(week_id: 1, user_id: 2, value: 20) }
    let!(:point_three) { Point.create(week_id: 1, user_id: 3, value: 0) }

    describe 'ordered' do

      it 'points by descending value' do
        Point.sorted.should eq [point_two, point_one, point_three]
      end

      it 'creates the expected sql for points by descending value' do
        expect(Point.sorted.to_sql.should == "SELECT \"points\".* FROM \"points\"  ORDER BY value DESC")
      end

    end

    describe 'point_for_user_and_week' do
      let!(:user) { double(User, id: 1) }
      let!(:week) { double(Week, id: 1) }

      it 'points for user and week' do
        Point.point_for_user_and_week(user,week).should eq [point_one]
      end

      it 'creates the expected sql for points user and week' do
        expect(Point.point_for_user_and_week(user,week).to_sql.should == "SELECT \"points\".* FROM \"points\"  WHERE (user_id = 1 and week_id = 1)")
      end
    end

  end

end
