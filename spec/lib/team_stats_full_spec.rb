require 'spec_helper'

describe TeamStatsFull do

  describe 'results and league_stats' do
    let(:liverpool) { Team.create(name: 'Liverpool') }
    let(:newcastle) { Team.create(name: 'Newcastle') }
    let(:everton)   { Team.create(name: 'Everton') }

    let!(:week_1) { Week.create(id: 1, description: 'W1', close_date: DateTime.parse('12-08-2017 14:00:00'), complete: false) }
    let!(:week_2) { Week.create(id: 2, description: 'W2', close_date: DateTime.parse('19-08-2017 14:00:00'), complete: false) }
    let!(:week_3) { Week.create(id: 3, description: 'W3', close_date: DateTime.parse('26-08-2017 14:00:00'), complete: false) }
    let!(:week_4) { Week.create(id: 4, description: 'W4', close_date: DateTime.parse('02-09-2017 14:00:00'), complete: false) }
    let!(:week_5) { Week.create(id: 5, description: 'W5', close_date: DateTime.parse('09-09-2017 14:00:00'), complete: false) }

    let(:fixtures) { [{id: 1, week_id: week_1.id, kickoff: 4.days.ago, home_team_id: liverpool.id, away_team_id: newcastle.id},
                      {id: 2, week_id: week_2.id, kickoff: 6.days.ago, home_team_id: newcastle.id, away_team_id: liverpool.id},
                      {id: 3, week_id: week_3.id, kickoff: 8.days.ago, home_team_id: liverpool.id, away_team_id: newcastle.id},
                      {id: 4, week_id: week_4.id, kickoff: 2.days.ago, home_team_id: newcastle.id, away_team_id: liverpool.id},
                      {id: 5, week_id: week_5.id, kickoff: 2.days.from_now, home_team_id: everton.id, away_team_id: liverpool.id}] }

    let(:scores) { [{id: 1, fixture_id: 1, home: 2, away: 0},
                    {id: 2, fixture_id: 2, home: 2, away: 2},
                    {id: 3, fixture_id: 3, home: 1, away: 2},
                    {id: 4, fixture_id: 4, home: 2, away: 3}] }

    before :each do
      fixtures.shuffle.each { |f| Fixture.create(id: f[:id],
                                                 week_id: f[:week_id],
                                                 kickoff: f[:kickoff],
                                                 home_team_id: f[:home_team_id],
                                                 away_team_id: f[:away_team_id]) }
      scores.each { |s| Score.create(id: s[:id],
                                     fixture_id: s[:fixture_id],
                                     home: s[:home],
                                     away: s[:away]) }

      Fixture.where(id: [1, 2, 3, 4]).each { |f| f.update_attributes(status: Fixture::Status::FINISHED) }
    end



    it 'returns teams stats ordered by kickoff' do
      allow(Week).to receive(:league_weeks).and_return([week_1, week_2, week_3, week_4, week_5])

      expect(TeamStatsFull.new(liverpool).perform).to eq({pld: 4, pts: 7, gf: 8, ga: 6, gd: 2,  form: 'LDWW', results: %w'L D W W'})
      expect(TeamStatsFull.new(newcastle).perform).to eq({pld: 4, pts: 4, gf: 6, ga: 8, gd: -2, form: 'WDLL', results: %w'W D L L'})
      expect(TeamStatsFull.new(everton).perform).to eq({pld: 0, pts: 0, gf: 0, ga: 0, gd: 0, form: '', results: []})
    end

  end
end
