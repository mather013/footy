require 'spec_helper'

module RakeTaskResources
  describe MarkSweepBets do

    describe ".perform" do
      let(:team_hash) { {arg: 1, bra: 2, col: 3, den: 4, eng: 5, fra: 6, ger: 7, hol: 8} }

      let(:week_5_ko) { 21.days.ago }
      let!(:week_5) { Week.create(id: 5, close_date: week_5_ko, description: 'Quarter-Final') }
      let!(:fixture_1) { week_5.fixtures.create(id: 1, kickoff: week_5_ko, home_team_id: 1, away_team_id: 5) }
      let!(:fixture_2) { week_5.fixtures.create(id: 2, kickoff: week_5_ko, home_team_id: 2, away_team_id: 6) }
      let!(:fixture_3) { week_5.fixtures.create(id: 3, kickoff: week_5_ko, home_team_id: 3, away_team_id: 7) }
      let!(:fixture_4) { week_5.fixtures.create(id: 4, kickoff: week_5_ko, home_team_id: 4, away_team_id: 8) }
      let!(:fixture_1_score) { fixture_1.create_score(home: 1, away: 0) }
      let!(:fixture_2_score) { fixture_2.create_score(home: 2, away: 1) }
      let!(:fixture_3_score) { fixture_3.create_score(home: 3, away: 1) }
      let!(:fixture_4_score) { fixture_4.create_score(home: 1, away: 0) }

      let(:week_6_ko) { 14.days.ago }
      let!(:week_6) { Week.create(id: 6, close_date: week_6_ko, description: 'Semi-Final') }
      let!(:fixture_5) { week_6.fixtures.create(id: 5, kickoff: week_6_ko, home_team_id: 1, away_team_id: 2) }
      let!(:fixture_6) { week_6.fixtures.create(id: 6, kickoff: week_6_ko, home_team_id: 3, away_team_id: 4) }
      let!(:fixture_5_score) { fixture_5.create_score(home: 0, away: 2) }
      let!(:fixture_6_score) { fixture_6.create_score(home: 5, away: 1) }

      let(:week_7_ko) { 1.day.ago }
      let!(:week_7) { Week.create(id: 7, close_date: week_7_ko, description: 'Final') }
      let!(:fixture_7) { week_7.fixtures.create(id: 7, kickoff: week_7_ko, home_team_id: 2, away_team_id: 3) }
      let!(:fixture_7_score) { fixture_7.create_score(home: 4, away: 0) }

      before :each do
        team_hash.each { |k, v| Team.create(id: v, name: k.to_s) }
        Team.all.each { |team| SweepPoint.create(team_id: team.id, value: 8) }
      end

      let(:expected_hash) { {1 => 6, 2 => 8, 3 => 7, 4 => 6, 5 => 5, 6 => 5, 7 => 5, 8 => 5} }

      it 'creates the expected points' do
        RakeTaskResources::MarkSweepBets.perform

        expected_hash.each do |k, v|
          expect(SweepPoint.find_by_team_id(k).value).to eq(v)
        end
      end
    end
  end
end
