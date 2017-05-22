require 'spec_helper'

describe Team do

  describe 'attributes' do
    it { should respond_to(:id) }
    it { should respond_to(:name) }
    it { should respond_to(:abbreviation) }
    it { should respond_to(:external_id) }
  end

  describe 'associations' do
    it { should have_one :standing }
    it { should have_many :players }
    it { should have_many :events }
    it { should have_one :sweep_point }
    it { should have_one :gb_point }
  end

  describe 'scopes' do
    before :each do
      ['Colombia', 'TBA', 'Argentina', 'Brazil'].each { |team_name| Team.create(name: team_name) }
    end

    describe 'sorted' do
      let(:expected_result) { ['Argentina', 'Brazil', 'Colombia'] }

      it 'returns ordered by team' do
        expect(Team.sorted.collect(&:name)).to eq(expected_result)
      end
    end
  end

  describe 'instance methods' do
    describe 'in_sweep?' do
      let(:team) { Team.create(name: 'Argentina', abbreviation: 'arg') }

      before :each do
        allow(Week).to receive(:count).and_return(7)
      end

      context 'when team is still in competition' do
        it 'returns true' do
          team.create_sweep_point(value: 8)

          expect(team.in_sweep?).to eq(true)
        end
      end

      context 'when team has been knocked out competition' do
        it 'returns false' do
          team.create_sweep_point(value: 6)

          expect(team.in_sweep?).to eq(false)
        end
      end

      context 'when a team is not in sweep at all' do
        it 'returns false' do
          expect(team.in_sweep?).to eq(false)
        end
      end
    end

    describe 'fixtures and fixtures_from' do
      let(:liverpool) { Team.create(name: 'Liverpool') }
      let(:newcastle) { Team.create(name: 'Newcastle') }

      let(:fixtures) { [{id: 1, kickoff: 2.days.from_now, home_team_id: liverpool.id, away_team_id: newcastle.id},
                        {id: 2, kickoff: 2.days.ago, home_team_id: newcastle.id, away_team_id: liverpool.id},
                        {id: 3, kickoff: 9.days.ago, home_team_id: liverpool.id, away_team_id: newcastle.id},
                        {id: 4, kickoff: 3.days.from_now, home_team_id: newcastle.id, away_team_id: liverpool.id}] }

      before :each do
        fixtures.shuffle.each { |f| Fixture.create(id: f[:id],
                                                   kickoff: f[:kickoff],
                                                   home_team_id: f[:home_team_id],
                                                   away_team_id: f[:away_team_id]) }
      end

      it 'returns all teams fixtures ordered by kickoff' do
        expect(liverpool.fixtures.collect(&:id)).to eq([3,2,1,4])
        expect(newcastle.fixtures.collect(&:id)).to eq([3,2,1,4])
      end

      it 'returns all teams fixtures from a date ordered by kickoff' do
        expect(liverpool.fixtures_from(1.day.ago).collect(&:id)).to eq([1,4])
        expect(newcastle.fixtures_from(8.days.ago).collect(&:id)).to eq([2,1,4])
      end

    end

    describe 'results and league_stats' do
      let(:liverpool) { Team.create(name: 'Liverpool') }
      let(:newcastle) { Team.create(name: 'Newcastle') }

      let(:fixtures) { [{id: 1, kickoff: 2.days.from_now, home_team_id: liverpool.id, away_team_id: newcastle.id},
                        {id: 2, kickoff: 2.days.ago, home_team_id: newcastle.id, away_team_id: liverpool.id},
                        {id: 3, kickoff: 9.days.ago, home_team_id: liverpool.id, away_team_id: newcastle.id},
                        {id: 4, kickoff: 3.days.from_now, home_team_id: newcastle.id, away_team_id: liverpool.id}] }

      let(:scores) { [{id: 1, fixture_id: 1, home: 2, away: 0 },
                      {id: 2, fixture_id: 2, home: 2, away: 2 },
                      {id: 3, fixture_id: 3, home: 1, away: 2 },
                      {id: 4, fixture_id: 4, home: 2, away: 3 }] }

      before :each do
        fixtures.shuffle.each { |f| Fixture.create(id: f[:id],
                                                   kickoff: f[:kickoff],
                                                   home_team_id: f[:home_team_id],
                                                   away_team_id: f[:away_team_id]) }
        scores.each { |s| Score.create(id: s[:id],
                                       fixture_id: s[:fixture_id],
                                       home: s[:home],
                                       away: s[:away]) }
      end

      it 'returns all teams results ordered by kickoff' do
        expect(liverpool.results).to eq(%w'L D W W')
        expect(newcastle.results).to eq(%w'W D L L')
      end

      it 'returns expected league stats' do
        expect(liverpool.league_stats).to eq({pld: 4, pts: 7, gf: 8, ga: 6, gd: 2, form: 'LDWW'})
        expect(newcastle.league_stats).to eq({pld: 4, pts: 4, gf: 6, ga: 8, gd: -2, form: 'WDLL'})
      end

    end

  end
end
