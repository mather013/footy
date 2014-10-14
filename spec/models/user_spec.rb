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
      let!(:player_1) { Player.create(name: 'S Gerrard', team_id: 1) }
      let!(:player_2) { Player.create(name: 'W Rooney', team_id: 1) }

      let!(:brazil) { Team.create(id: 2, name: 'Brazil', abbreviation: 'bra') }
      let!(:player_3) { Player.create(name: 'Neymar', team_id: 2) }

      let!(:argentina) { Team.create(id: 3, name: 'Argentina', abbreviation: 'arg') }
      let!(:player_4) { Player.create(name: 'Messi', team_id: 3) }

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

      xit { should == [england,england,brazil] }

    end

  end
end
