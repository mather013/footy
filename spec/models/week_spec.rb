require 'spec_helper'

describe Week do

  describe 'associations' do
    it { should have_many :fixtures }
    it { should have_many :points }
  end

  describe 'attributes' do
    it { should respond_to(:id) }
    it { should respond_to(:close_date) }
    it { should respond_to(:description) }
    it { should respond_to(:complete) }
  end

  describe 'scopes' do
    let!(:week_01) { Week.create(description: 'Week 01', close_date: 40.days.ago, complete: true) }
    let!(:week_02) { Week.create(description: 'Week 02', close_date: 35.days.ago, complete: false) }
    let!(:week_03) { Week.create(description: 'Week 03', close_date: 30.days.ago, complete: true) }
    let!(:week_04) { Week.create(description: 'Week 04', close_date: 25.days.ago, complete: true) }
    let!(:week_05) { Week.create(description: 'Week 05', close_date: 20.days.ago, complete: true) }
    let!(:week_06) { Week.create(description: 'Week 06', close_date: 15.days.ago, complete: true) }
    let!(:week_07) { Week.create(description: 'Week 07', close_date: 10.days.ago, complete: true) }
    let!(:week_08) { Week.create(description: 'Week 08', close_date: 5.days.ago,  complete: true) }
    let!(:week_09) { Week.create(description: 'Week 09', close_date: 1.hour.from_now, complete: false) }
    let!(:week_10) { Week.create(description: 'Week 10', close_date: 5.days.from_now, complete: false) }
    let!(:week_11) { Week.create(description: 'Week 11', close_date: 10.days.from_now, complete: false) }

    describe 'sorted' do

      it 'weeks by ascending close_date' do
        expect(Week.sorted).to eq [week_01, week_02, week_03, week_04, week_05, week_06, week_07, week_08, week_09, week_10, week_11]
      end

      it 'creates the expected sql for weeks by ascending close_date' do
        expect(Week.sorted.to_sql).to eq("SELECT \"weeks\".* FROM \"weeks\" ORDER BY close_date asc")
      end
    end

    describe 'sorted_open' do

      it 'weeks by not complete and ascending close_date' do
        expect(Week.sorted_open).to eq [week_09, week_10, week_11]
      end
    end

    describe 'sorted_recent' do

      it 'weeks by not complete and close_date' do
        expect(Week.sorted_recent).to eq [week_02, week_05, week_06, week_07, week_08, week_09, week_10, week_11]
      end
    end

    describe 'sorted_non_recent' do

      it 'weeks by complete and close_date' do
        expect(Week.sorted_non_recent).to eq [week_01, week_03, week_04]
      end
    end
  end

  describe 'class methods' do

    describe 'current' do
      let!(:week_01) { Week.create(description: 'Week 01', close_date: 1.days.ago) }
      let!(:week_02) { Week.create(description: 'Week 02', close_date: 1.days.from_now) }
      let!(:week_03) { Week.create(description: 'Week 03', close_date: 2.days.from_now) }

      it 'returns the immediate week' do
        expect(Week.current).to eq week_02
      end

    end

    describe 'previous' do
      let!(:week_01) { Week.create(description: 'Week 01', close_date: 1.days.ago) }
      let!(:week_02) { Week.create(description: 'Week 02', close_date: 1.days.from_now) }
      let!(:week_03) { Week.create(description: 'Week 03', close_date: 2.days.from_now) }

      it 'returns the immediate week' do
        expect(Week.previous).to eq week_01
      end

    end
  end

  describe 'instance methods' do
    let(:week_id) { 1 }
    let(:complete) { false }
    let(:close_date) { 7.days.ago }
    let(:week) { Week.create(id: week_id, close_date: close_date, complete: complete, description: 'Week 99') }

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

      context 'week is close date is way in future' do

        #context 'and week is first ' do
        #  let(:close_date) { 21.days.from_now }
        #
        #  xit "returns 'Open'" do
        #    expect(week.status).to eq 'Open'
        #  end
        #end

        #context 'and week is not first ' do
          let(:week_id) { 101 }
          let(:close_date) { 21.days.from_now }

          it "returns 'Pending'" do
            expect(week.status).to eq 'Pending'
          end
        #end
      end
    end

    describe '#close_date_local_time' do
      let(:close_date) { 1.days.from_now }

      it "calls time zone with 'London' parameter" do
        expect(week).to receive(:close_date).and_return(close_date)
        expect(close_date).to receive(:in_time_zone).with('London')
        week.close_date_local_time
      end
    end

    describe '#winning_teams' do
      let(:team_one) { Team.create(id: 1, name: 'Argentina') }
      let(:team_two) { Team.create(id: 2, name: 'Brazil') }
      let(:team_three) { Team.create(id: 3, name: 'Colombia') }
      let(:team_four) { Team.create(id: 4, name: 'Denmark') }
      let!(:fixture_one) { Fixture.create(week_id: week.id, status: Fixture::Status::FINISHED, home_team_id: team_one.id, away_team_id: team_two.id) }
      let!(:fixture_two) { Fixture.create(week_id: week.id, status: Fixture::Status::FINISHED, home_team_id: team_three.id, away_team_id: team_four.id) }
      let!(:score_one) { Score.create(fixture_id: fixture_one.id, home: 0, away: 1) }
      let!(:score_two) { Score.create(fixture_id: fixture_two.id, home: 1, away: 0) }

      it 'reruns expected array of winning teams for week' do
        expect(week.winning_teams).to eq [team_two, team_three]
      end
    end

    describe '#results_hash' do
      let(:team_one) { Team.create(id: 1, name: 'Argentina', abbreviation: 'arg') }
      let(:team_two) { Team.create(id: 2, name: 'Brazil', abbreviation: 'bra') }
      let(:team_three) { Team.create(id: 3, name: 'Colombia', abbreviation: 'col') }
      let(:team_four) { Team.create(id: 4, name: 'Denmark', abbreviation: 'den') }
      let!(:fixture_one) { Fixture.create(week_id: week.id, home_team_id: team_one.id, away_team_id: team_two.id) }
      let!(:fixture_two) { Fixture.create(week_id: week.id, home_team_id: team_three.id, away_team_id: team_four.id) }
      let!(:score_one) { Score.create(fixture_id: fixture_one.id, home: 0, away: 1) }
      let!(:score_two) { Score.create(fixture_id: fixture_two.id, home: 1, away: 0) }

      it 'reruns expected hash of results' do
        expect(week.results_hash).to eq ({arg: 'L', bra: 'W', col: 'W', den: 'L'})
      end

    end

    describe '#maybe_mark_complete' do
      let!(:fixture_one) { Fixture.create(id: 1, week_id: week.id, status: Fixture::Status::FINISHED) }
      let!(:fixture_two) { Fixture.create(id: 2, week_id: week.id, status: Fixture::Status::IN_PLAY) }
      let!(:score_one) { Score.create(id: 1, fixture_id: 1, home: 1, away: 0) }

      context 'when all scores are in' do
        let!(:score_two) { Score.create(id: 2, fixture_id: 2, home: 1, away: 0) }

        context 'fixtures are all finished' do
          it 'marks week as complete' do
            fixture_two.update_attributes(status: Fixture::Status::FINISHED)

            week.maybe_mark_complete
            expect(week.complete).to eq (true)
          end
        end

        context 'fixtures are not all finished' do
          it 'does not mark week as complete' do
            week.maybe_mark_complete
            expect(week.complete).to eq (false)
          end
        end
      end

      context 'when all scores are not in' do
        it 'does not mark week as complete' do
          week.maybe_mark_complete
          expect(week.complete).to eq (false)
        end
      end

    end

    describe '#mark_complete' do
      let(:week) { Week.create(id: 2, close_date: 2.days.from_now, complete: false, description: 'Week 66') }

      before :each do
        week.mark_complete
      end

      it 'set week to complete' do
        expect(week.complete).to eq (true)
      end
    end

    describe '#fixtures_strict' do
      let!(:week_01) { Week.create(description: 'Week 01', close_date: 1.days.ago) }
      let!(:week_02) { Week.create(description: 'Week 02', close_date: 5.days.from_now) }

      let!(:fixture_one) { Fixture.create(week_id: week_01.id, kickoff: 1.day.from_now) }
      let!(:fixture_two) { Fixture.create(week_id: week_01.id, kickoff: 10.days.from_now) }
      let!(:fixture_three) { Fixture.create(week_id: week_01.id, kickoff: 2.day.from_now) }
      let!(:fixture_four) { Fixture.create(week_id: week_01.id, kickoff: 1.day.ago) }
      let!(:fixture_five) { Fixture.create(week_id: week_01.id, kickoff: 2.day.ago, status: Fixture::Status::POSTPONED) }
      let!(:fixture_six) { Fixture.create(week_id: week_02.id, kickoff: 1.day.from_now) }

      it 'returns fixtures that have not had their kickoff moved outside of their week or postponed' do
        expect(week_01.fixtures_strict).to eq([fixture_one,fixture_three])
        expect(week_02.fixtures_strict).to eq([fixture_six])
      end

    end
  end
end
