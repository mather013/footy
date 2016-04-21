require 'spec_helper'

module RakeTaskResources
  describe MarkGbBets do

    describe ".perform" do
      let(:team_hash) { { arg: 1, bra: 2, col: 3, den: 4, eng: 5, fra: 6 } }

      let(:week_three_ko) { 1.days.ago }
      let!(:week_three) { Week.create(id: 3, close_date: week_three_ko, description: 'Week 03') }
      let!(:fixture_7) { week_three.fixtures.create(id:7, kickoff: week_three_ko, home_team_id: 1, away_team_id: 4) }
      let!(:fixture_7_score) { fixture_7.create_score(home:0, away:0) }

      let!(:fixture_8) { week_three.fixtures.create(id:8, kickoff: week_three_ko, home_team_id: 2, away_team_id: 5) }
      let!(:fixture_8_score) { fixture_8.create_score(home:1, away:0) }
      let!(:fixture_8_events) { [fixture_8.events.create(event_type: 'goal', minute: 18, team_id: 2)] }

      let!(:fixture_9) { week_three.fixtures.create(id:9, kickoff: week_three_ko, home_team_id: 3, away_team_id: 6) }
      let!(:fixture_9_score) { fixture_9.create_score(home:6, away:0) }
      let!(:fixture_9_events) { [fixture_9.events.create(event_type: 'goal', minute: 14, team_id: 3)] }
      let!(:fixture_9_events) { [fixture_9.events.create(event_type: 'goal', minute: 15, team_id: 3)] }
      let!(:fixture_9_events) { [fixture_9.events.create(event_type: 'goal', minute: 16, team_id: 3)] }
      let!(:fixture_9_events) { [fixture_9.events.create(event_type: 'goal', minute: 17, team_id: 3)] }
      let!(:fixture_9_events) { [fixture_9.events.create(event_type: 'goal', minute: 18, team_id: 3)] }
      let!(:fixture_9_events) { [fixture_9.events.create(event_type: 'goal', minute: 19, team_id: 3)] }

      let(:week_one_ko) { 14.days.ago }
      let!(:week_one) { Week.create(id: 1, close_date: week_one_ko, description: 'Week 01') }
      let!(:fixture_1) { week_one.fixtures.create(id:1, kickoff: week_one_ko, home_team_id: 1, away_team_id: 2) }
      let!(:fixture_1_score) { fixture_1.create_score(home:0, away:2) }
      let!(:fixture_1_events) { [fixture_1.events.create(event_type: 'goal', minute: 21, team_id: 2),
                                 fixture_1.events.create(event_type: 'owngoal', minute: 22, team_id: 2)] }

      let!(:fixture_2) { week_one.fixtures.create(id:2, kickoff: week_one_ko, home_team_id: 3, away_team_id: 4) }
      let!(:fixture_2_score) { fixture_2.create_score(home:5, away:1) }
      let!(:fixture_2_events) { [fixture_2.events.create(event_type: 'goal', minute: 31, team_id: 3),
                                 fixture_2.events.create(event_type: 'goal', minute: 32, team_id: 3),
                                 fixture_2.events.create(event_type: 'goal', minute: 33, team_id: 3),
                                 fixture_2.events.create(event_type: 'goal', minute: 34, team_id: 3),
                                 fixture_2.events.create(event_type: 'goal', minute: 35, team_id: 3),
                                 fixture_2.events.create(event_type: 'goal', minute: 41, team_id: 4)] }

      let!(:fixture_3) { week_one.fixtures.create(id:3, kickoff: week_three_ko, home_team_id: 5, away_team_id: 6) }
      let!(:fixture_3_score) { fixture_3.create_score(home:2, away:8) }
      let!(:fixture_3_events) { [fixture_3.events.create(event_type: 'goal', minute: 51, team_id: 5),
                                 fixture_3.events.create(event_type: 'goal', minute: 52, team_id: 5),
                                 fixture_3.events.create(event_type: 'goal', minute: 61, team_id: 6),
                                 fixture_3.events.create(event_type: 'goal', minute: 62, team_id: 6),
                                 fixture_3.events.create(event_type: 'goal', minute: 63, team_id: 6),
                                 fixture_3.events.create(event_type: 'goal', minute: 64, team_id: 6),
                                 fixture_3.events.create(event_type: 'goal', minute: 65, team_id: 6),
                                 fixture_3.events.create(event_type: 'goal', minute: 66, team_id: 6),
                                 fixture_3.events.create(event_type: 'goal', minute: 67, team_id: 6),
                                 fixture_3.events.create(event_type: 'goal', minute: 68, team_id: 6)] }

      let(:week_two_ko) { 7.days.ago }
      let!(:week_two) { Week.create(id: 2, close_date: week_two_ko, description: 'Week 02') }
      let!(:fixture_4) { week_two.fixtures.create(id:4, kickoff: week_two_ko, home_team_id: 2, away_team_id: 1) }
      let!(:fixture_4_score) { fixture_4.create_score(home:4, away:0) }
      let!(:fixture_4_events) { [fixture_4.events.create(event_type: 'goal', minute: 21, team_id: 2),
                                 fixture_4.events.create(event_type: 'goal', minute: 22, team_id: 2),
                                 fixture_4.events.create(event_type: 'goal', minute: 23, team_id: 2),
                                 fixture_4.events.create(event_type: 'owngoal', minute: 24, team_id: 2)] }

      let!(:fixture_5) { week_two.fixtures.create(id:5, kickoff: week_two_ko, home_team_id: 4, away_team_id: 3) }
      let!(:fixture_5_score) { fixture_5.create_score(home:0, away:4) }
      let!(:fixture_5_events) { [fixture_5.events.create(event_type: 'goal', minute: 31, team_id: 3),
                                 fixture_5.events.create(event_type: 'goal', minute: 32, team_id: 3),
                                 fixture_5.events.create(event_type: 'goal', minute: 33, team_id: 3),
                                 fixture_5.events.create(event_type: 'owngoal', minute: 34, team_id: 3)] }

      let!(:fixture_6) { week_two.fixtures.create(id:6, kickoff: week_two_ko, home_team_id: 6, away_team_id: 5) }
      let!(:fixture_6_score) { fixture_6.create_score(home:3, away:1) }
      let!(:fixture_6_events) { [fixture_6.events.create(event_type: 'goal', minute: 61, team_id: 6),
                                 fixture_6.events.create(event_type: 'goal', minute: 62, team_id: 6),
                                 fixture_6.events.create(event_type: 'goal', minute: 63, team_id: 6),
                                 fixture_6.events.create(event_type: 'owngoal', minute: 51, team_id: 5)] }

      before :each do
        team_hash.each { |k,v| Team.create(id: v, name: k.to_s) }
        Team.all.each { |team| GbPoint.create(team_id: team.id, value: 0) }
      end

      context 'when goal buster round is week 1' do
        let!(:round) { GbRound.create(starting_week_id: 1) }
        let(:expected_hash) { {1 => 0, 2 => 7, 3 => 9, 4 => 1, 5 => 3, 6 => 11} }
        let(:expected_minute_hash) { {1 => nil, 2 => 24, 3 => 34, 4 => 41, 5 => 51, 6 => 63} }

        it 'creates the expected points' do
          RakeTaskResources::MarkGbBets.perform

          expected_hash.each do |k, v|
            expect(GbPoint.find_by_team_id(k).value).to eq(v)
          end
        end

        it 'creates the expected minutes' do
          RakeTaskResources::MarkGbBets.perform

          expected_minute_hash.each do |k, v|
            #expect(GbPoint.find_by_team_id(k).minute).to eq(v)
            expect(GbPoint.find_by_team_id(k).minute).to eq(nil)
          end
        end
      end

      context 'when goal buster round is week 2' do
        let!(:round) { GbRound.create(starting_week_id: 2) }
        let(:expected_hash) { {1 => 0, 2 => 5, 3 => 10, 4 => 0, 5 => 3, 6 => 11} }
        let(:expected_minute_hash) { {1 => nil, 2 => 24, 3 => 34, 4 => 41, 5 => 51, 6 => 63} }

        it 'creates the expected points' do
          RakeTaskResources::MarkGbBets.perform

          expected_hash.each do |k, v|
            expect(GbPoint.find_by_team_id(k).value).to eq(v)
          end
        end

        it 'creates the expected minutes' do
          RakeTaskResources::MarkGbBets.perform

          expected_minute_hash.each do |k, v|
            #expect(GbPoint.find_by_team_id(k).minute).to eq(v)
            expect(GbPoint.find_by_team_id(k).minute).to eq(nil)
          end
        end
      end

    end
  end
end
