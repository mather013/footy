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
    it { should respond_to(:status) }
  end

  describe 'mass assignment' do
    [:id, :home_team_id, :away_team_id, :kickoff, :week_id, :name, :external_id, :status].each do |attribute|
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

    describe 'requiring_score' do
      let!(:fixture_one) { Fixture.create(kickoff: 12.hours.ago, external_id: nil) }
      let!(:fixture_two) { Fixture.create(kickoff: 120.minutes.ago, external_id: nil) }
      let!(:fixture_three) { Fixture.create(kickoff: 124.minutes.ago, external_id: nil) }
      let!(:fixture_four) { Fixture.create(kickoff: 60.minutes.ago, external_id: nil) }
      let!(:fixture_five) { Fixture.create(kickoff: 2.days.ago, external_id: nil) }
      let!(:fixture_six) { Fixture.create(kickoff: 8.days.ago, external_id: nil) }

      it 'returns the expected fixtures' do
        fixture_three.create_score(home: 1, away: 2)
        Fixture.requiring_score.should eq [fixture_one, fixture_two, fixture_five]
      end
    end

    describe 'recent_not_finished' do
      let!(:fixture_one) { Fixture.create(kickoff: 12.hours.ago, status: 'finished', external_id: nil) }
      let!(:fixture_two) { Fixture.create(kickoff: 120.minutes.ago, status: 'in_play', external_id: nil) }
      let!(:fixture_three) { Fixture.create(kickoff: 124.minutes.ago, status: 'in_play', external_id: nil) }
      let!(:fixture_four) { Fixture.create(kickoff: 60.minutes.ago, status: 'in_play', external_id: nil) }
      let!(:fixture_five) { Fixture.create(kickoff: 2.days.ago, status: 'finished', external_id: nil) }
      let!(:fixture_six) { Fixture.create(kickoff: 8.days.ago, status: 'in_play', external_id: nil) }

      it 'returns the expected fixtures' do
        Fixture.recent_not_finished.should eq [fixture_two, fixture_three, fixture_four]
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

    describe '#betable?' do

      context 'when week deadline toggle is on' do

        before :each do
          stub_const('TOGGLES_CONFIG', {'week_deadline' => true})
        end

        context 'week has not closed and fixture has not kicked off ' do
          it 'returns true' do
            expect(fixture.betable?).to be_true
          end
        end

        context 'week has closed and fixture has not kicked off' do
          let(:close_date) { 1.days.ago }
          let(:kickoff) { 1.days.from_now }

          it 'returns false' do
            expect(fixture.betable?).to be_false
          end
        end

        context 'week has closed and fixture has kicked off' do
          let(:close_date) { 2.days.ago }
          let(:kickoff) { 1.days.ago }

          it 'returns false' do
            expect(fixture.betable?).to be_false
          end
        end

        context 'week has closed and fixture has not kicked off but is postponed' do
          let(:close_date) { 2.days.ago }
          let(:kickoff) { 1.days.ago }

          it 'returns false' do
            fixture.update_attributes(status: Fixture::Status::POSTPONED)
            expect(fixture.betable?).to be_false
          end
        end

      end

      context 'when week deadline toggle is off' do

        before :each do
          stub_const('TOGGLES_CONFIG', {'week_deadline' => false})
        end

        context 'week has not closed and fixture has not kicked off ' do
          it 'returns true' do
            expect(fixture.betable?).to be_true
          end
        end

        context 'week has closed and fixture has not kicked off' do
          let(:close_date) { 1.days.ago }
          let(:kickoff) { 1.days.from_now }

          it 'returns false' do
            expect(fixture.betable?).to be_true
          end
        end

        context 'week has closed and fixture has kicked off' do
          let(:close_date) { 2.days.ago }
          let(:kickoff) { 1.days.ago }

          it 'returns false' do
            expect(fixture.betable?).to be_false
          end
        end

        context 'week has closed and fixture has been postponed' do
          let(:close_date) { 2.days.ago }
          let(:kickoff) { 1.days.ago }

          it 'returns true' do
            fixture.update_attributes(status: Fixture::Status::POSTPONED)
            expect(fixture.betable?).to be_true
          end
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

        before :each do
          fixture.update_attributes(status: status)
        end

        context 'fixture has finished' do
          let(:status) { Fixture::Status::FINISHED }

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

        context 'fixture has not finished' do
          let(:status) { Fixture::Status::IN_PLAY }

          context 'and the score is a draw' do
            let!(:score) { Score.create(fixture_id: fixture.id, home: 1, away: 1) }

            it 'returns nil' do
              expect(fixture.winning_team).to be_nil
            end
          end

          context 'and the home team is wining' do
            let!(:score) { Score.create(fixture_id: fixture.id, home: 1, away: 0) }

            it 'returns nil' do
              expect(fixture.winning_team).to be_nil
            end
          end

          context 'and the away is winning' do
            let!(:score) { Score.create(fixture_id: fixture.id, home: 0, away: 1) }

            it 'returns nil' do
              expect(fixture.winning_team).to be_nil
            end
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
      its(:choices) { should == [{name: 'Home', value: 'H'}, {name: 'Draw', value: 'D'}, {name: 'Away', value: 'A'}] }
    end

    describe '#record_score' do
      let(:score_hash) { {home: 2, away: 1} }

      context 'when fixture already has a score' do
        let!(:score) { Score.create(fixture_id: fixture.id, home: 0, away: 0) }

        it 'updates the score' do
          fixture.record_score(score_hash)

          fixture.score.home.should eq(2)
          fixture.score.away.should eq(1)
        end
      end

      context 'when fixture does not have a score' do
        let(:score) { nil }

        it 'creates the score' do
          fixture.record_score(score_hash)

          fixture.score.home.should eq(2)
          fixture.score.away.should eq(1)
        end
      end
    end

    describe '#teams' do
      subject { fixture }
      its(:teams) { should =~ [home_team, away_team] }
    end

    describe '#bonus_available?' do

      before :each do
        fixture.stub(:score).and_return(score)
      end

      context 'when fixture does not have a score' do
        let(:score) { nil }

        it 'returns false' do
          expect(fixture.bonus_available?).to eq(false)
        end
      end

      context 'when fixture has a score' do
        let(:score) { double(Score, outcome: 'D') }
        let(:bets) { [double(Bet, value: 'D'),
                      double(Bet, value: 'H'), double(Bet, value: 'H'), double(Bet, value: 'H'), double(Bet, value: 'H'), double(Bet, value: 'H'),
                      double(Bet, value: 'A'), double(Bet, value: 'A'), double(Bet, value: 'A'), double(Bet, value: 'A')] }

        before :each do
          fixture.stub(:bets).and_return(bets)
        end

        context 'and no bet value exists below the bonus threshold' do

          it 'returns false' do
            stub_const('ENVIRONMENT_CONFIG', { 'bonus_threshold' => 10 })
            expect(fixture.bonus_available?).to eq(false)
          end
        end

        context 'and a bet value exists below the bonus threshold' do

          it 'returns true' do
            stub_const('ENVIRONMENT_CONFIG', { 'bonus_threshold' => 15 })
            expect(fixture.bonus_available?).to eq(true)
          end
        end

      end
    end

    describe '#finished?' do
      let(:fixture) { Fixture.new(status: status) }

      context 'when a fixture has finished' do
        let(:status) { Fixture::Status::FINISHED }

        it 'returns true' do
          expect(fixture.finished?).to eq(true)
        end
      end

      context 'when a fixture has not finished' do
        let(:status) { Fixture::Status::IN_PLAY }

        it 'returns false' do
          expect(fixture.finished?).to eq(false)
        end
      end
    end

    describe '#in_play?' do
      let(:fixture) { Fixture.new(status: status) }

      context 'when a fixture is in_play' do
        let(:status) { Fixture::Status::IN_PLAY }

        it 'returns true' do
          expect(fixture.in_play?).to eq(true)
        end
      end

      context 'when a fixture has not in_play' do
        let(:status) { Fixture::Status::DEFINED }

        it 'returns false' do
          expect(fixture.in_play?).to eq(false)
        end
      end
    end

    describe '#postponed?' do
      let(:fixture) { Fixture.new(status: status) }

      context 'when a fixture is postponed' do
        let(:status) { Fixture::Status::POSTPONED }

        it 'returns true' do
          expect(fixture.postponed?).to eq(true)
        end
      end

      context 'when a fixture is not postponed' do
        let(:status) { Fixture::Status::FINISHED }

        it 'returns false' do
          expect(fixture.postponed?).to eq(false)
        end
      end
    end

  end
end
