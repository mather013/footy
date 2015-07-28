require 'spec_helper'

module RakeTaskResources
  describe MarkGbBets do

    describe ".perform" do
      let(:expected_hash) { {1 => 0, 2 => 6, 3 => 9, 4 => 1, 5 => 3, 6 => 11} }

      let(:team_hash) { { arg: 1, bra: 2, col: 3, den: 4, eng: 5, fra: 6 } }

      let(:week_one_ko) { 14.days.ago }
      let!(:week_one) { Week.create(id: 1, close_date: week_one_ko, description: 'Week 01') }
      let!(:fixture_1) { week_one.fixtures.create(id:1, kickoff: week_one_ko, home_team_id: 1, away_team_id: 2).create_score(home:0, away:2) }
      let!(:fixture_2) { week_one.fixtures.create(id:2, kickoff: week_one_ko, home_team_id: 3, away_team_id: 4).create_score(home:5, away:1) }
      let!(:fixture_3) { week_one.fixtures.create(id:3, kickoff: week_one_ko, home_team_id: 5, away_team_id: 6).create_score(home:2, away:8) }

      let(:week_two_ko) { 7.days.ago }
      let!(:week_two) { Week.create(id: 2, close_date: week_two_ko, description: 'Week 02') }
      let!(:fixture_4) { week_two.fixtures.create(id:4, kickoff: week_two_ko, home_team_id: 2, away_team_id: 1).create_score(home:4, away:0) }
      let!(:fixture_5) { week_two.fixtures.create(id:5, kickoff: week_two_ko, home_team_id: 4, away_team_id: 3).create_score(home:0, away:4) }
      let!(:fixture_6) { week_two.fixtures.create(id:6, kickoff: week_two_ko, home_team_id: 6, away_team_id: 5).create_score(home:3, away:1) }

      let!(:round) { GbRound.create(starting_week_id: 1) }

      it 'creates the expected points' do
        team_hash.each { |k,v| Team.create(id: v, name: k.to_s) }
        Team.all.each { |team| GbPoint.create(team_id: team.id, value: 0) }

        RakeTaskResources::MarkGbBets.perform

        expected_hash.each do |k, v|
          expect(GbPoint.find_by_team_id(k).value).to eq(v)
        end
      end
    end
  end
end
