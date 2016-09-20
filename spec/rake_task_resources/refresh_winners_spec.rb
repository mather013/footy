require 'spec_helper'

module RakeTaskResources
  describe RefreshWinners do

    describe ".perform" do

      let!(:week_1) { Week.create(id: 1, close_date: DateTime.parse('13-08-2015 11:30:00'), description: 'Week 01', complete: true) }
      let!(:week_2) { Week.create(id: 2, close_date: DateTime.parse('20-08-2015 11:30:00'), description: 'Week 02', complete: true) }
      let!(:week_3) { Week.create(id: 3, close_date: DateTime.parse('27-08-2015 11:30:00'), description: 'Week 03', complete: true) }
      let!(:week_4) { Week.create(id: 4, close_date: DateTime.parse('02-09-2015 11:30:00'), description: 'Week 04', complete: true) }
      let!(:week_5) { Week.create(id: 5, close_date: DateTime.parse('09-09-2015 11:30:00'), description: 'Week 05', complete: true) }
      let!(:week_6) { Week.create(id: 6, close_date: DateTime.parse('16-09-2015 11:30:00'), description: 'Week 06', complete: true) }
      let!(:week_7) { Week.create(id: 7, close_date: DateTime.parse('23-09-2015 11:30:00'), description: 'Week 07', complete: true) }
      let!(:week_8) { Week.create(id: 8, close_date: DateTime.parse('10-10-2015 11:30:00'), description: 'Week 08', complete: true) }

      let!(:user_1) { User.create(id: 1, name: 'Andy', username: 'acole', password: 'abc') }
      let!(:user_2) { User.create(id: 2, name: 'Brad', username: 'bjones', password: 'abc') }
      let!(:user_3) { User.create(id: 3, name: 'Chris', username: 'csutton', password: 'abc') }
      let!(:user_4) { User.create(id: 4, name: 'David', username: 'dginola', password: 'abc') }

      context 'when processing weekly winners' do

        before :each do
          stub_const('ENVIRONMENT_CONFIG', {'winners' => 'weekly'})
        end

        let(:expected_hash) { {1 => 1, 2 => 2, 3 => 4, 4 => 4, 5 => 3, 6 => 2, 8 => 1} }

        it 'creates the expected winners' do
          user_1.points.create(week_id: week_1.id, value: 90) # winner - week_1
          user_2.points.create(week_id: week_1.id, value: 80)
          user_3.points.create(week_id: week_1.id, value: 70)
          user_4.points.create(week_id: week_1.id, value: 80)

          user_1.points.create(week_id: week_2.id, value: 70)
          user_2.points.create(week_id: week_2.id, value: 70) # winner - week_2 (week 4)
          user_3.points.create(week_id: week_2.id, value: 70)
          user_4.points.create(week_id: week_2.id, value: 60)

          user_1.points.create(week_id: week_3.id, value: 60)
          user_2.points.create(week_id: week_3.id, value: 60)
          user_3.points.create(week_id: week_3.id, value: 60)
          user_4.points.create(week_id: week_3.id, value: 90) # winner - week_3

          user_1.points.create(week_id: week_4.id, value: 20)
          user_2.points.create(week_id: week_4.id, value: 60)
          user_3.points.create(week_id: week_4.id, value: 30)
          user_4.points.create(week_id: week_4.id, value: 70) # winner - week_4

          user_1.points.create(week_id: week_5.id, value: 10)
          user_2.points.create(week_id: week_5.id, value: 40)
          user_3.points.create(week_id: week_5.id, value: 50) # winner - week_5 (week 8)
          user_4.points.create(week_id: week_5.id, value: 50)

          user_1.points.create(week_id: week_6.id, value: 70)
          user_2.points.create(week_id: week_6.id, value: 70) # winner - week_6 (week 7)
          user_3.points.create(week_id: week_6.id, value: 50)
          user_4.points.create(week_id: week_6.id, value: 50)

          user_1.points.create(week_id: week_7.id, value: 20)
          user_2.points.create(week_id: week_7.id, value: 40)
          user_3.points.create(week_id: week_7.id, value: 40)
          user_4.points.create(week_id: week_7.id, value: 40)

          user_1.points.create(week_id: week_8.id, value: 90) # winner - week_8
          user_2.points.create(week_id: week_8.id, value: 80)
          user_3.points.create(week_id: week_8.id, value: 80)
          user_4.points.create(week_id: week_8.id, value: 70)

          RakeTaskResources::RefreshWinners.perform

          expected_hash.each do |k, v|
            expect(Winners::WeeklyWinner.find_by_number(k).user_id).to eq(v)
          end
        end
      end

      context 'when processing monthly winners' do

        before :each do
          stub_const('ENVIRONMENT_CONFIG', {'winners' => 'monthly'})
        end

        let(:expected_hash) { {8 => [4], 9 => [2], 10 => [1,2]} }

        it 'creates the expected winners' do

          user_1.points.create(week_id: week_1.id, value: 30)
          user_2.points.create(week_id: week_1.id, value: 80)
          user_3.points.create(week_id: week_1.id, value: 70)
          user_4.points.create(week_id: week_1.id, value: 80)

          user_1.points.create(week_id: week_2.id, value: 30)
          user_2.points.create(week_id: week_2.id, value: 70)
          user_3.points.create(week_id: week_2.id, value: 70)
          user_4.points.create(week_id: week_2.id, value: 90)

          user_1.points.create(week_id: week_3.id, value: 60)
          user_2.points.create(week_id: week_3.id, value: 40)
          user_3.points.create(week_id: week_3.id, value: 50)
          user_4.points.create(week_id: week_3.id, value: 50) # winner - month_1

          user_1.points.create(week_id: week_4.id, value: 20)
          user_2.points.create(week_id: week_4.id, value: 60)
          user_3.points.create(week_id: week_4.id, value: 30)
          user_4.points.create(week_id: week_4.id, value: 70)

          user_1.points.create(week_id: week_5.id, value: 10)
          user_2.points.create(week_id: week_5.id, value: 40)
          user_3.points.create(week_id: week_5.id, value: 50)
          user_4.points.create(week_id: week_5.id, value: 50)

          user_1.points.create(week_id: week_6.id, value: 70)
          user_2.points.create(week_id: week_6.id, value: 70)
          user_3.points.create(week_id: week_6.id, value: 50)
          user_4.points.create(week_id: week_6.id, value: 50)

          user_1.points.create(week_id: week_7.id, value: 10)
          user_2.points.create(week_id: week_7.id, value: 60) # winner - month_2
          user_3.points.create(week_id: week_7.id, value: 10)
          user_4.points.create(week_id: week_7.id, value: 10)

          user_1.points.create(week_id: week_8.id, value: 70) # winner - month_3
          user_2.points.create(week_id: week_8.id, value: 70) # winner - month_3
          user_3.points.create(week_id: week_8.id, value: 60)
          user_4.points.create(week_id: week_8.id, value: 20)

          RakeTaskResources::RefreshWinners.perform

          expected_hash.each do |k, v|
            expect(Winners::MonthlyWinner.find_all_by_number(k).collect(&:user_id)).to eq(v)
          end

        end

      end

    end
  end
end
