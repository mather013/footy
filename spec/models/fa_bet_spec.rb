require 'spec_helper'

describe FaBet do

  describe 'associations' do
    it { should belong_to :user }
    it { should belong_to :player }
  end

  describe 'attributes' do
    it { should respond_to(:id) }
    it { should respond_to(:user_id) }
    it { should respond_to(:player_id) }
  end

  describe 'mass assignment' do
    [:id, :user_id, :player_id].each do |attribute|
      it { should allow_mass_assignment_of(attribute) }
    end
  end

  describe 'validation' do
    let(:user) { User.create(name: 'Bill', username: 'bill', password: 'abc') }

    context 'when user has already created an fa_bet with this player' do
      it 'is an invalid bet' do
        FaBet.create(player_id: 1, user_id: user.id)
        FaBet.new(player_id: 1, user_id: user.id).should_not be_valid
      end
    end

    context 'when user has not yet created a fa_bet with this player' do
      it 'is a valid bet' do
        FaBet.create(player_id: 1, user_id: user.id)
        FaBet.new(player_id: 2, user_id: user.id).should be_valid
      end
    end
  end

  describe 'instance methods' do

    describe 'check_combination_unique?' do
      let(:user_one) { User.create(name: 'Bill', username: 'bill', password: 'abc') }
      let(:user_two) { User.create(name: 'Ben', username: 'ben', password: 'abc') }
      let(:user_one_selections) { [1, 2, 3, 4] }

      context 'when creating 5 alive bet' do
        before :each do
          user_one_selections.each { |player_id| FaBet.create(user_id: user_one.id, player_id: player_id) }
          user_two_selections.each { |player_id| FaBet.create(user_id: user_two.id, player_id: player_id) }

          @bet = FaBet.create(user_id: user_one.id, player_id: 5)
        end

        context 'and combination has not already been chosen by another user' do
          let(:user_two_selections) { [6, 3, 4, 1, 2] }

          it 'allows bet to be recorded' do
            expect(User.find(user_one.id).fa_bets.map(&:player_id).sort).to eq([1, 2, 3, 4, 5])
          end

          it 'adds error to model' do
            expect(@bet.errors.present?).to be_false
          end
        end

        context 'and combination has already been chosen by another user' do
          let(:user_two_selections) { [5, 2, 4, 3, 1] }

          it 'does not allow bet to be recorded' do
            expect(User.find(user_one.id).fa_bets.map(&:player_id).sort).to eq([1, 2, 3, 4])
          end

          it 'does not add error to model' do
            expect(@bet.errors.present?).to be_true
          end
        end
      end

      context 'when updating 5 alive bet' do
        before :each do
          user_one_selections.each { |player_id| FaBet.create(user_id: user_one.id, player_id: player_id) }
          user_two_selections.each { |player_id| FaBet.create(user_id: user_two.id, player_id: player_id) }

          @bet = FaBet.create(user_id: user_one.id, player_id: 7)
          @bet.update_attributes(player_id: 5)
        end

        context 'and combination has not already been chosen by another user' do
          let(:user_two_selections) { [6, 2, 1, 3, 4] }

          it 'allows bet to be recorded' do
            expect(User.find(user_one.id).fa_bets.map(&:player_id).sort).to eq([1, 2, 3, 4, 5])
          end

          it 'does not add error to model' do
            expect(@bet.errors.present?).to be_false
          end
        end

        context 'and combination has already been chosen by another user' do
          let(:user_two_selections) { [5, 3, 2, 4, 1] }

          it 'does not allow bet to be recorded' do
            expect(User.find(user_one.id).fa_bets.map(&:player_id).sort).to eq([1, 2, 3, 4, 7])
          end

          it 'adds error to model' do
            expect(@bet.errors.present?).to be_true
          end

        end
      end

    end
  end
end
