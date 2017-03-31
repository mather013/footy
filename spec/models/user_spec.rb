require 'spec_helper'

describe User do

  describe 'associations' do
    it { should have_many :hda_bets }
    it { should have_many :fa_bets }
    it { should have_many :lms_bets }
    it { should have_many :hda_points }
    it { should have_many :communications }
    it { should have_one :fa_point }
    it { should have_one :lms_point }
    it { should have_one :position }
    it { should have_and_belong_to_many :games }
  end

  describe 'attributes' do
    it { should respond_to(:name) }
    it { should respond_to(:username) }
    it { should respond_to(:password) }
    it { should respond_to(:mobile) }
  end

  describe 'mass assignment' do
    [:id, :name, :username, :password, :mobile].each do |attribute|
      it { should allow_mass_assignment_of(attribute) }
    end
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

        it { should be_true }
      end

      context 'user is not a read only user' do
        let(:user) { User.create(name: 'Player', username: 'player', password: 'abc') }

        subject { user.read_only? }

        it { should be_false }
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

      let(:fa_bets) { [Bets::FaBet.create(user_id: user.id, player_id: player_1.id),
                       Bets::FaBet.create(user_id: user.id, player_id: player_2.id),
                       Bets::FaBet.create(user_id: user.id, player_id: player_3.id)]}

      before (:each) do
        user.fa_bets << fa_bets
      end

      subject { user.fa_teams }
      it { should == [england,england,brazil] }

    end

    describe '#lm_survivor?' do
      let!(:user) { User.create(name: 'Guest', username: 'guest', password: 'abc') }
      let!(:lm_round) { Rounds::LmsRound.create(week_id: 1) }
      let!(:bet)  { Bets::LmsBet.create(lms_round_id: lm_round.id, user_id: user.id, team_id: 1) }

      before :each do
        user.stub(:read_only?).and_return(false)
        Bets::LmsBet.any_instance.stub(:correct?).and_return(true)
        Rounds::LmsRound.create(week_id: 2)
      end

      context 'when user is not a lms survivor' do

        before :each do
          Rounds::LmsRound.create(week_id: 3)
        end

        it 'returns false' do
          expect(user.lm_survivor?).to be_false
        end
      end

      context 'when user is a lms survivor' do
        it 'returns true' do
          expect(user.lm_survivor?).to be_true
        end
      end

    end

    describe '#in_sweep?' do
      let(:user) { User.create(name: 'Bruce', username: 'brucew', password: 'abc') }

      before :each do
        user.stub(:sweep_bet).and_return(sweep_bet)
      end

      context 'when user has a sweep bet' do
        let(:team) { double(Team, name: 'Brazil', in_sweep?: in_sweep) }
        let(:sweep_bet) { double(Bets::SweepBet, team: team) }

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
