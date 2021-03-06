require 'spec_helper'

describe User do

  describe 'associations' do
    it { should have_many :bets }
    it { should have_many :fa_bets }
    it { should have_many :lm_bets }
    it { should have_many :points }
    it { should have_many :communications }
    it { should have_one :fa_point }
    it { should have_one :lm_point }
    it { should have_one :position }
    it { should have_and_belong_to_many :games }
  end

  describe 'attributes' do
    it { should respond_to(:name) }
    it { should respond_to(:username) }
    it { should respond_to(:password) }
    it { should respond_to(:mobile) }
  end

  describe 'validations' do
    [:name, :username, :password].each do |attribute|
      it { should validate_presence_of(attribute) }
    end
  end

  describe 'instance methods' do

    describe '#read_only_user?' do

      context 'user is a read only user' do
        let(:user) { User.create(name: 'Guest', username: 'guest', password: 'abc') }

        subject { user.read_only? }

        it { should be_truthy }
      end

      context 'user is not a read only user' do
        let(:user) { User.create(name: 'Player', username: 'player', password: 'abc') }

        subject { user.read_only? }

        it { should be_falsey }
      end

    end

    describe '#fa_teams' do

      let(:user) { User.create(name: 'Guest', username: 'guest', password: 'abc') }

      let!(:england) { Team.create(id: 1, name: 'England', abbreviation: 'eng') }
      let!(:player_1) { Player.create(surname: 'Gerrard', team_id: 1) }
      let!(:player_2) { Player.create(surname: 'Rooney', team_id: 1) }

      let!(:brazil) { Team.create(id: 2, name: 'Brazil', abbreviation: 'bra') }
      let!(:player_3) { Player.create(surname: 'Neymar', team_id: 2) }

      let!(:argentina) { Team.create(id: 3, name: 'Argentina', abbreviation: 'arg') }
      let!(:player_4) { Player.create(surname: 'Messi', team_id: 3) }

      let(:fa_bets) { [FaBet.create(user_id: user.id, player_id: player_1.id),
                       FaBet.create(user_id: user.id, player_id: player_2.id),
                       FaBet.create(user_id: user.id, player_id: player_3.id)]}

      before (:each) do
        user.fa_bets << fa_bets
      end

      subject { user.fa_teams }
      it { should == [england,england,brazil] }

    end

    describe '#lm_survivor?' do
      let!(:user) { User.create(name: 'Guest', username: 'guest', password: 'abc') }
      let!(:lm_round) { LmRound.create(week_id: 1) }
      let!(:bet)  { LmBet.create(lm_round_id: lm_round.id, user_id: user.id, team_id: 1) }

      before :each do
        allow(user).to receive(:read_only?).and_return(false)
        allow_any_instance_of(LmBet).to receive(:correct?).and_return(true)
        LmRound.create(week_id: 2)
      end

      context 'when user is not a lms survivor' do

        before :each do
          LmRound.create(week_id: 3)
        end

        it 'returns false' do
          expect(user.lm_survivor?).to be_falsey
        end
      end

      context 'when user is a lms survivor' do
        it 'returns true' do
          expect(user.lm_survivor?).to be_truthy
        end
      end

    end

    describe '#in_sweep?' do
      let(:user) { User.create(name: 'Bruce', username: 'brucew', password: 'abc') }

      before :each do
        allow(user).to receive(:sweep_bet).and_return(sweep_bet)
      end

      context 'when user has a sweep bet' do
        let(:team) { double(Team, name: 'Brazil', in_sweep?: in_sweep) }
        let(:sweep_bet) { double(SweepBet, team: team) }

        context 'the team is still in competition' do
          let(:in_sweep) { true }

          it 'returns true' do
            expect(user.in_sweep?).to eq(true)
          end
        end

        context 'the team is no longer in competition' do
          let(:in_sweep) { false }

          it 'returns false' do
            expect(user.in_sweep?).to eq(false)
          end
        end
      end

      context 'when user does not have a sweep bet' do
        let(:sweep_bet) { nil }

        it 'returns false' do
          expect(user.in_sweep?).to eq(false)
        end
      end
    end
  end
end
