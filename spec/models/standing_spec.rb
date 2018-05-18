require 'spec_helper'

describe Standing do

  describe 'attributes' do
    it { should respond_to(:id) }
    it { should respond_to(:team_id) }
    it { should respond_to(:position) }
    it { should respond_to(:form) }
    it { should respond_to(:points) }
  end

  describe 'associations' do
    it { should belong_to :team }
  end

  describe '.up_to_date?' do
    let(:finished_fixtures) { [double(Fixture), [double(Fixture)]] }

    before :each do
      Standing.delete_all
      allow(Fixture).to receive(:finished).and_return(finished_fixtures)
      allow(finished_fixtures).to receive(:joins).with(:score).and_return([double(Fixture), double(Fixture)])
    end

    context 'when standings are up to date' do

      it 'returns true' do
        allow(Standing).to receive(:count).and_return(2)
        Standing.create(position: 1, team_id: 1, points: 6, played: 2, goal_difference: 2)
        Standing.create(position: 2, team_id: 2, points: 0, played: 2, goal_difference: -2)
        expect(Standing.up_to_date?).to eq true
      end
    end

    context 'when standings are not up to date' do

      context 'because there are no standings' do
        it 'returns false' do
          expect(Standing.up_to_date?).to eq false
        end
      end

      context 'because fixtures have finished since last refresh' do
        it 'returns false' do
          allow(Standing).to receive(:count).and_return(2)
          expect(Standing.up_to_date?).to eq false
        end
      end
    end
  end

  describe '.refresh' do #moved to sub classes
    let(:team_1) { double(Team, id: 1, name: 'Argentina', league_stats: {pld: 3, pts: 9, gf: 8, ga: 1, gd: 7, form: 'WWW'}) }
    let(:team_2) { double(Team, id: 2, name: 'Brazil', league_stats: {pld: 3, pts: 6, gf: 5, ga: 6, gd: -1, form: 'LWW'}) }
    let(:team_3) { double(Team, id: 3, name: 'Chile', league_stats: {pld: 3, pts: 1, gf: 1, ga: 5, gd: -4, form: 'DLL'}) }
    let(:team_4) { double(Team, id: 4, name: 'Denmark', league_stats: {pld: 3, pts: 1, gf: 0, ga: 2, gd: -2, form: 'DLL'}) }

    before :each do
      Standing.delete_all
    end

    xit 'creates expected standings data' do
      allow(Team).to receive(:all).and_return([team_1, team_2, team_3, team_4])

      Standing.refresh

      standings = Standing.sorted
      expect(standings.count).to eq(4)

      first_pos = standings[0]
      expect(first_pos.team_id).to eq(team_1.id)
      expect(first_pos.points).to eq(9)
      expect(first_pos.played).to eq(3)
      expect(first_pos.goal_difference).to eq(7)
      expect(first_pos.form).to eq('WWW')

      second_pos = standings[1]
      expect(second_pos.team_id).to eq(team_2.id)
      expect(second_pos.points).to eq(6)
      expect(second_pos.played).to eq(3)
      expect(second_pos.goal_difference).to eq(-1)
      expect(second_pos.form).to eq('LWW')

      third_pos = standings[2]
      expect(third_pos.team_id).to eq(team_4.id)
      expect(third_pos.points).to eq(1)
      expect(third_pos.played).to eq(3)
      expect(third_pos.goal_difference).to eq(-2)
      expect(third_pos.form).to eq('DLL')

      forth_pos = standings[3]
      expect(forth_pos.team_id).to eq(team_3.id)
      expect(forth_pos.points).to eq(1)
      expect(forth_pos.played).to eq(3)
      expect(forth_pos.goal_difference).to eq(-4)
      expect(forth_pos.form).to eq('DLL')
    end

  end
end
