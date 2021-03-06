require 'spec_helper'

describe LmBet do

  describe 'associations' do
    it { should belong_to :user }
    it { should belong_to :team }
    it { should belong_to :lm_round }
  end

  describe 'attributes' do
    it { should respond_to(:id) }
    it { should respond_to(:user_id) }
    it { should respond_to(:team_id) }
    it { should respond_to(:lm_round_id) }
  end

  describe 'validations' do

    context 'when user has already created a lms bet for this round' do
      it 'is an invalid bet' do
        LmBet.create(lm_round_id: 1, user_id: 1, team_id: 1)
        expect(LmBet.new(lm_round_id: 1, user_id: 1, team_id: 2)).to_not be_valid
      end
    end

    context 'when user has already created a lms bet using this team' do
      it 'is an invalid bet' do
        LmBet.create(lm_round_id: 1, user_id: 1, team_id: 1)
        expect(LmBet.new(lm_round_id: 2, user_id: 1, team_id: 1)).to_not be_valid
      end
    end

    context 'when user has not yet created a lms bet for this round or team' do
      it 'is a valid bet' do
        LmBet.create(lm_round_id: 1, user_id: 1, team_id: 1)
        expect(LmBet.new(lm_round_id: 2, user_id: 1, team_id: 2)).to be_valid
      end
    end
  end

  describe 'scopes' do

    describe 'bets_for_user_and_round' do
      let(:user_one) { double(User, id: 1) }
      let(:user_two) { double(User, id: 2) }
      let(:team) { double(Team, id: 1) }
      let(:lm_round) { double(LmRound, id: 1) }

      it 'returns expected bets for user and lm_round' do
        bet_one = LmBet.create(lm_round_id: 1, user_id: user_one.id, team_id: team.id)
        LmBet.create(lm_round_id: 1, user_id: user_two.id, team_id: team.id)

        expect(LmBet.bets_for_user_and_round(user_one, lm_round)).to eq [bet_one]
      end
    end
  end

  describe 'instance methods' do

    describe '#correct?' do
      let(:team) { double(Team, id: 1) }
      let(:week) { double(Week, id: 1) }
      let(:lm_round) { double(LmRound, id: 1, week_id: week.id) }
      let(:lm_bet) { LmBet.create(user_id: 1, team_id: team.id, lm_round_id: 1) }

      before :each do
        allow(lm_bet).to receive(:team).and_return(team)
        allow(lm_bet).to receive(:lm_round).and_return(lm_round)
        allow(lm_round).to receive(:week).and_return(week)
      end

      context "when user's team has won" do

        it 'returns true' do
          expect(week).to receive(:winning_teams).and_return([team])
          expect(lm_bet.correct?).to be_truthy
        end
      end

      context "when user's team has not won - there are no winning teams" do
        it 'returns false' do
          expect(week).to receive(:winning_teams).and_return([])
          expect(lm_bet.correct?).to be_falsey
        end
      end

    end

    describe '#result' do
      let(:team) { double(Team, id: 1, abbreviation: 'col') }
      let(:week) { double(Week, results_hash: { arg: 'L', bra: 'W', col: 'W', den: 'L' }) }
      let(:lm_round) { double(LmRound, id: 1, week: week) }
      let(:lm_bet) { LmBet.create(user_id: 1, team_id: team.id, lm_round_id: 1) }

      before :each do
        allow(lm_bet).to receive(:lm_round).and_return(lm_round)
        allow(lm_bet).to receive(:team).and_return(team)
      end

      it 'returns the outcome for the lms bet' do
        expect(lm_bet.result).to eq 'W'
      end
    end

    describe '#opposing_team_name' do
      let!(:home_team) { Team.create(id: 1, name: 'Argentina', abbreviation: 'arg') }
      let!(:away_team) { Team.create(id: 2, name: 'Brazil', abbreviation: 'bra') }
      let(:lm_bet) { LmBet.create(user_id: 1, team_id: team.id, lm_round_id: 1) }

      before :each do
        Week.create(id: 1,  description: 'Week 01', close_date: 1.week.from_now)
        Fixture.create(id: 1, week_id: 1, home_team_id: 1, away_team_id: 2, name: 'ARG-BRA')
        LmRound.create(id:1, week_id:1)
      end

      context 'when bet is for home team' do
        let(:team) { home_team }

        it 'returns expected opposition with away identifier' do
          expect(lm_bet.opposing_team_name).to eq('Brazil (H)')
        end
      end

      context 'when bet is for away team' do
        let(:team) { away_team }

        it 'returns expected opposition with home identifier' do
          expect(lm_bet.opposing_team_name).to eq('Argentina (A)')
        end
      end

    end

  end
end
