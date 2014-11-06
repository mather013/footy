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

  describe 'mass assignment' do
    [:id, :user_id, :team_id, :lm_round_id].each do |attribute|
      it { should allow_mass_assignment_of(attribute) }
    end
  end

  describe 'validations' do

    context 'when user has already created a lms bet for this round' do
      it 'is an invalid bet' do
        LmBet.create(lm_round_id: 1, user_id: 1, team_id: 1)
        LmBet.new(lm_round_id: 1, user_id: 1, team_id: 2).should_not be_valid
      end
    end

    context 'when user has already created a lms bet using this team' do
      it 'is an invalid bet' do
        LmBet.create(lm_round_id: 1, user_id: 1, team_id: 1)
        LmBet.new(lm_round_id: 2, user_id: 1, team_id: 1).should_not be_valid
      end
    end

    context 'when user has not yet created a lms bet for this round or team' do
      it 'is a valid bet' do
        LmBet.create(lm_round_id: 1, user_id: 1, team_id: 1)
        LmBet.new(lm_round_id: 2, user_id: 1, team_id: 2).should be_valid
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
        lm_bet.stub(:team).and_return(team)
        lm_bet.stub(:lm_round).and_return(lm_round)
        lm_round.stub(:week).and_return(week)
      end

      context "when user's team has won" do

        it 'returns true' do
          week.stub(:winning_teams).and_return([team])
          expect(lm_bet.correct?).to be_true
        end
      end

      context "when user's team has not won - there are no winning teams" do
        it 'returns false' do
          week.stub(:winning_teams).and_return([])
          expect(lm_bet.correct?).to be_false
        end
      end

    end

    describe '#result' do
      let(:team) { double(Team, id: 1, abbreviation: 'col') }
      let(:week) { double(Week, results_hash: { arg: "L", bra: "W", col: "W", den: "L" }) }
      let(:lm_round) { double(LmRound, id: 1, week: week) }
      let(:lm_bet) { LmBet.create(user_id: 1, team_id: team.id, lm_round_id: 1) }

      before :each do
        lm_bet.stub(:lm_round).and_return(lm_round)
        lm_bet.stub(:team).and_return(team)
      end

      it 'returns the outcome for the lms bet' do
        expect(lm_bet.result).to eq 'W'
      end
    end
  end
end
