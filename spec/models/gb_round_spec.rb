require 'spec_helper'

describe GbRound do

  describe 'associations' do
    it { should belong_to :week }
  end

  describe 'attributes' do
    it { should respond_to(:id) }
    it { should respond_to(:starting_week_id) }
  end

  describe 'class methods' do

    describe '.available_choices' do
      let(:expected_result) { [1, 4] }
      let(:teams) { [double(Team, id: 1), double(Team, id: 2), double(Team, id: 3), double(Team, id: 4)] }
      let(:bets) { [double(GbBet, team_id: 2), double(GbBet, team_id: 3)] }

      it 'returns expected choices' do
        expect(Team).to receive(:all).and_return(teams)
        expect(GbBet).to receive(:all).and_return(bets)
        expect(GbRound.available_choices).to eq(expected_result)
      end
    end
  end

  describe 'instance methods' do
    let(:week) { Week.create(id: 4, close_date: DateTime.parse('2015-08-30 18:30:00'), description: 'Week 04') }
    let(:gb_round) { GbRound.create(id: 1, starting_week_id: week.id) }

    describe '#open?' do

      before :each do
        Timecop.freeze(date_time)
      end

      after :each do
        Timecop.return
      end

      context 'when time is before open_at' do
        let(:date_time) { DateTime.parse('2015-08-30 09:30:00') }

        it "returns false" do
          expect(gb_round.open?).to be_falsey
        end
      end

      context 'when time is after round open_at' do
        let(:date_time) { DateTime.parse('2015-08-30 10:30:00') }

        it "returns true" do
          expect(gb_round.open?).to be_truthy
        end
      end
    end

    describe '#open_at' do
      let(:expected_date_time) { DateTime.parse('2015-08-30 10:00:00') }

      it "returns expected datetime the round opens" do
        expect(gb_round.open_at).to eq(expected_date_time)
      end
    end
  end
end
