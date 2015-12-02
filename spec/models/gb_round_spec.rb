require 'spec_helper'

describe GbRound do

  describe 'associations' do
    it { should belong_to :week }
  end

  describe 'attributes' do
    it { should respond_to(:id) }
    it { should respond_to(:starting_week_id) }
  end

  describe 'mass assignment' do
    [:id, :starting_week_id].each do |attribute|
      it { should allow_mass_assignment_of(attribute) }
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
          expect(gb_round.open?).to be_false
        end
      end

      context 'when time is after round open_at' do
        let(:date_time) { DateTime.parse('2015-08-30 10:30:00') }

        it "returns true" do
          expect(gb_round.open?).to be_true
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
