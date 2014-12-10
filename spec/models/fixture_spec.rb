require 'spec_helper'

describe Fixture do

  describe 'associations' do
    it { should belong_to :week }
    it { should belong_to :home_team }
    it { should belong_to :away_team }
    it { should have_one :score }
    it { should have_many :events }
  end

  describe 'attributes' do
    it { should respond_to(:id) }
    it { should respond_to(:home_team_id) }
    it { should respond_to(:away_team_id) }
    it { should respond_to(:kickoff) }
    it { should respond_to(:week_id) }
    it { should respond_to(:name) }
    it { should respond_to(:external_id) }
  end

  describe 'mass assignment' do
    [:id, :home_team_id, :away_team_id, :kickoff, :week_id, :name, :external_id].each do |attribute|
      it { should allow_mass_assignment_of(attribute) }
    end
  end

  describe 'scopes' do
    describe 'requiring_sync' do
      let!(:fixture_one) { Fixture.create(kickoff: 2.days.from_now, external_id: nil) }
      let!(:fixture_two) { Fixture.create(kickoff: 3.days.from_now, external_id: nil) }
      let!(:fixture_three) { Fixture.create(kickoff: 10.days.from_now, external_id: nil) }

      it 'returns the expected fixtures' do
        Fixture.requiring_sync.should eq [fixture_one, fixture_two]
      end
    end

    describe 'recently_finished' do
      let!(:fixture_one) { Fixture.create(kickoff: 180.minutes.ago, external_id: nil) }
      let!(:fixture_two) { Fixture.create(kickoff: 120.minutes.ago, external_id: nil) }
      let!(:fixture_three) { Fixture.create(kickoff: 124.minutes.ago, external_id: nil) }
      let!(:fixture_four) { Fixture.create(kickoff: 60.minutes.ago, external_id: nil) }

      it 'returns the expected fixtures' do
        Fixture.recently_finished.should eq [fixture_two, fixture_three]
      end
    end

  end

  describe 'instance methods' do
    let(:close_date) { 1.days.from_now }
    let(:week) { Week.create(close_date: close_date, description: 'Week 99') }
    let(:kickoff) { 2.days.from_now }
    let(:home_team) { Team.create(name: 'Liverpool') }
    let(:away_team) { Team.create(name: 'Everton') }
    let(:fixture) { Fixture.create(week_id: week.id, home_team_id: home_team.id, away_team_id: away_team.id, kickoff: kickoff) }

    describe '#to_s' do
      it 'returns full description of the fixture' do
        expect(fixture.to_s).to eq 'Liverpool vs Everton'
      end
    end

    describe '#bet_able?' do
      context 'week has not closed and fixture has not kicked off ' do
        it 'returns true' do
          expect(fixture.bet_able?).to be_true
        end
      end

      context 'week has closed and fixture has not kicked off' do
        let(:close_date) { 1.days.ago }
        let(:kickoff) { 1.days.from_now }

        it 'returns false' do
          expect(fixture.bet_able?).to be_false
        end
      end

      context 'week has closed and fixture has kicked off' do
        let(:close_date) { 2.days.ago }
        let(:kickoff) { 1.days.ago }

        it 'returns false' do
          expect(fixture.bet_able?).to be_false
        end
      end

    end

    describe '#winning_team' do

      context 'score does not yet exists for fixture' do
        it 'returns nil' do
          expect(fixture.winning_team).to be_nil
        end
      end

      context 'score exists for fixture' do

        context 'and the result is a draw' do
          let!(:score) { Score.create(fixture_id: fixture.id, home: 1, away: 1) }

          it 'returns nil' do
            expect(fixture.winning_team).to be_nil
          end
        end

        context 'and the home team won' do
          let!(:score) { Score.create(fixture_id: fixture.id, home: 1, away: 0) }

          it 'returns home team' do
            expect(fixture.winning_team).to eq home_team
          end
        end

        context 'and the away team won' do
          let!(:score) { Score.create(fixture_id: fixture.id, home: 0, away: 1) }

          it 'returns away team' do
            expect(fixture.winning_team).to eq away_team
          end
        end

      end
    end

    describe '#kickoff_local_time' do
      let(:kickoff) { 1.days.from_now }

      it "calls time zone with 'London' parameter" do
        fixture.should_receive(:kickoff).and_return(kickoff)
        kickoff.should_receive(:in_time_zone).with('London')
        fixture.kickoff_local_time
      end
    end

    describe '#choices' do
      subject { fixture }
      its(:choices) { should == [{ name: "Home", value: "H" }, { name: "Draw", value: "D" }, { name: "Away", value: "A" }] }
    end

  end
end
