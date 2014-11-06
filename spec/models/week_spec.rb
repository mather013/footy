require 'spec_helper'

describe Week do

  describe 'associations' do
    it { should have_many :fixtures }
  end

  describe 'attributes' do
    it { should respond_to(:id) }
    it { should respond_to(:close_date) }
    it { should respond_to(:description) }
    it { should respond_to(:complete) }
  end

  describe 'mass assignment' do
    [:id, :close_date, :description, :complete].each do |attribute|
      it { should allow_mass_assignment_of(attribute) }
    end
  end

  describe 'scopes' do
    let!(:week_one) { Week.create(description: 'Week 01', close_date: 1.days.from_now) }
    let!(:week_two) { Week.create(description: 'Week 02', close_date: 2.days.from_now) }
    let!(:week_three) { Week.create(description: 'Week 03', close_date: 3.days.from_now) }

    describe 'ordered' do

      it 'weeks by ascending close_date' do
        Week.sorted.should eq [week_one, week_two, week_three]
      end

      it 'creates the expected sql for weeks by ascending close_date' do
        expect(Week.sorted.to_sql.should == "SELECT \"weeks\".* FROM \"weeks\"  ORDER BY close_date")
      end
    end
  end

  describe 'class methods' do

    describe 'current' do
      let!(:week_one) { Week.create(description: 'Week 01', close_date: 1.days.ago) }
      let!(:week_two) { Week.create(description: 'Week 02', close_date: 1.days.from_now) }
      let!(:week_three) { Week.create(description: 'Week 03', close_date: 2.days.from_now) }

      it 'returns the immediate week' do
        expect(Week.current).to eq week_two
      end

    end
  end

  describe 'instance methods' do
    let(:complete) { false }
    let(:close_date) { 7.days.ago }
    let(:week) { Week.create(id:1 , close_date: close_date, complete: complete, description: 'Week 99') }

    describe '#status' do
      context 'week is complete' do
        let(:complete) { true }
        it "returns 'Complete' " do
          expect(week.status).to eq 'Complete'
        end
      end

      context 'week is open' do
        let(:close_date) { 1.days.from_now }
        it "returns 'Open'" do
          expect(week.status).to eq 'Open'
        end
      end

      context 'week is in play' do
        let(:close_date) { 1.days.ago }
        it "returns 'In play'" do
          expect(week.status).to eq 'In play'
        end
      end

      context 'week is not open, in play or complete' do
        let(:close_date) { 21.days.from_now }
        it "returns 'Pending' " do
          expect(week.status).to eq 'Pending'
        end
      end

    end

    describe '#close_date_local_time' do
      let(:close_date) { 1.days.from_now }

      it "calls time zone with 'London' parameter" do
        week.should_receive(:close_date).and_return(close_date)
        close_date.should_receive(:in_time_zone).with('London')
        week.close_date_local_time
      end
    end

    describe '#winning_teams' do
      let(:team_one)   { Team.create(id: 1, name: 'Argentina') }
      let(:team_two)   { Team.create(id: 2, name: 'Brazil') }
      let(:team_three) { Team.create(id: 3, name: 'Colombia') }
      let(:team_four)  { Team.create(id: 4, name: 'Denmark') }
      let!(:fixture_one) { Fixture.create(week_id: week.id, home_team_id: team_one.id, away_team_id: team_two.id) }
      let!(:fixture_two) { Fixture.create(week_id: week.id, home_team_id: team_three.id, away_team_id: team_four.id) }
      let!(:score_one) { Score.create(fixture_id: fixture_one.id, home: 0, away: 1) }
      let!(:score_two) { Score.create(fixture_id: fixture_two.id, home: 1, away: 0) }

      it 'reruns expected array of winning teams for week' do
        expect(week.winning_teams).to eq [team_two,team_three]
      end
    end

    describe '#results_hash' do
      let(:team_one)   { Team.create(id: 1, name: 'Argentina', abbreviation: 'arg') }
      let(:team_two)   { Team.create(id: 2, name: 'Brazil', abbreviation: 'bra') }
      let(:team_three) { Team.create(id: 3, name: 'Colombia', abbreviation: 'col') }
      let(:team_four)  { Team.create(id: 4, name: 'Denmark', abbreviation: 'den') }
      let!(:fixture_one) { Fixture.create(week_id: week.id, home_team_id: team_one.id, away_team_id: team_two.id) }
      let!(:fixture_two) { Fixture.create(week_id: week.id, home_team_id: team_three.id, away_team_id: team_four.id) }
      let!(:score_one) { Score.create(fixture_id: fixture_one.id, home: 0, away: 1) }
      let!(:score_two) { Score.create(fixture_id: fixture_two.id, home: 1, away: 0) }

      it 'reruns expected hash of results' do
        expect(week.results_hash).to eq ({ arg: "L", bra: "W", col: "W", den: "L" })
      end

    end

  end
end
