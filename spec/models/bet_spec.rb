require 'spec_helper'

describe Bet do

  describe 'associations' do
    it { should belong_to :fixture }
    it { should belong_to :user }
  end

  describe 'attributes' do
    it { should respond_to(:id) }
    it { should respond_to(:fixture_id) }
    it { should respond_to(:user_id) }
    it { should respond_to(:value) }
  end

  describe 'mass assignment' do
    [:id, :fixture_id, :user_id, :value].each do |attribute|
      it { should allow_mass_assignment_of(attribute) }
    end
  end

  describe 'validation' do

    context 'when user has already created a bet for this fixture' do
      it 'is an invalid bet' do
        Bet.create(fixture_id: 1, user_id: 1, value: 'H')
        Bet.new(fixture_id: 1, user_id: 1, value: 'H').should_not be_valid
      end
    end

    context 'when user has not yet created a bet for this fixture' do
      it 'is a valid bet' do
        Bet.create(fixture_id: 1, user_id: 1, value: 'H')
        Bet.new(fixture_id: 2, user_id: 1, value: 'H').should be_valid
      end
    end

    describe 'check_permitted' do
      let(:user) { User.create(name: 'User 1', username: 'user_1', password: 'password') }
      let(:home_team) { Team.create(name: 'Liverpool', abbreviation: 'liv') }
      let(:away_team) { Team.create(name: 'Everton', abbreviation: 'eve') }
      let(:fixture) { Fixture.create(home_team_id: home_team.id, away_team_id: away_team.id, kickoff: kickoff, name: 'LIV-EVE') }

      context 'when creating bet' do

        context 'when fixture has not yet kickoff' do
          let(:kickoff) { 1.day.from_now }

          it 'allows the bet to be created' do
            bet = user.bets.create(fixture_id: fixture.id, value: 'H')
            expect(Bet.count).to eq 1
          end
        end

        context 'when fixture has kicked off' do
          let(:kickoff) { 1.day.ago }

          it 'does not allow the bet to be created' do
            bet = user.bets.create(fixture_id: fixture.id, value: 'H')
            expect(bet.errors.messages).to eq ({:fixture_id => ["fixture has already kicked off"]})
            expect(Bet.count).to eq 0
          end
        end
      end

      context 'when updating bet' do
        let(:kickoff) { 1.day.from_now }
        let!(:bet) { user.bets.create(fixture_id: fixture.id, value: 'H') }

        context 'when fixture has not yet kickoff' do

          it 'allows the bet to be updated' do
            bet.update_attributes(value: 'D')
            expect(Bet.count).to eq 1
          end
        end

        context 'when fixture has kicked off' do

          it 'does not allow the bet to be updated' do
            fixture.update_attributes(kickoff: 1.day.ago)
            bet.fixture.reload
            bet.update_attributes(value: 'D')
            bet.reload
            expect(bet.errors.messages).to eq ({:fixture_id => ["fixture has already kicked off"]})
            expect(Bet.count).to eq 1
            expect(bet.value).to eq 'H'
          end
        end
      end
    end
  end

  describe 'scopes' do
    let!(:user_one) { User.create(id: 1, name: 'Bill', username: 'bill', password: 'abc') }
    let!(:user_two) { User.create(id: 2, name: 'Ben', username: 'ben', password: 'abc') }

    let!(:bet_one) { Bet.create(user_id: 1, fixture_id: 1, value: 'H') }
    let!(:bet_two) { Bet.create(user_id: 2, fixture_id: 2, value: 'H') }

    it 'points by descending value' do
      Bet.bets_for_user_and_fixtures(user_one, [1, 2]).should eq [bet_one]
    end

    it 'creates the expected sql for returning bets for user and fixtures' do
      expect(Bet.bets_for_user_and_fixtures(user_one, [1, 2, 3]).to_sql.should == "SELECT \"bets\".* FROM \"bets\"  WHERE (user_id = 1 and fixture_id in (1,2,3))")
    end

  end

  describe 'instance methods' do
    let(:bet_value) { TOGGLES_CONFIG['bet_type_hda'] ? 'H' : '2 - 0' }
    let!(:bet) { Bet.create(fixture_id: 1, user_id: 1, value: bet_value) }
    let!(:fixture) { Fixture.create(id: 1) }

    describe '#outcome' do

      context 'when the score exists' do
        let!(:score) { Score.create(fixture_id: 1, home: 1, away: 0) }

        context 'bet is correct' do

          it "returns 'correct'" do
            expect(bet.outcome).to eq 'correct'
          end
        end

        context 'bet is incorrect' do
          let(:bet_value) { TOGGLES_CONFIG['bet_type_hda'] ? 'A' : '0 - 1' }

          it "returns 'correct'" do
            expect(bet.outcome).to eq 'wrong'
          end
        end

        unless TOGGLES_CONFIG['bet_type_hda']
          context "bet is 'spot on'" do
            let(:bet_value) { '1 - 0' }

            it "returns 'spot on'" do
              expect(bet.outcome).to eq('spot_on')
            end
          end
        end
      end

      context 'when the score does no exist' do
        it 'returns blank' do
          expect(bet.outcome).to be_blank
        end

      end
    end

    describe '#correct?' do
      let!(:score) { Score.create(fixture_id: 1, home: 1, away: 0) }

      context "bet is correct" do
        let(:bet_value) { TOGGLES_CONFIG['bet_type_hda'] ? 'H' : '1 - 0' }

        it 'true' do
          expect(bet.correct?).to be_true
        end
      end

      context "bet is incorrect" do
        let(:bet_value) { TOGGLES_CONFIG['bet_type_hda'] ? 'A' : '0 - 2' }

        it 'true' do
          expect(bet.correct?).to be_false
        end
      end

    end
  end
end
