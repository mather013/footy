require 'spec_helper'

describe EventsController do

  before :each do
    log_in_as "admin"
  end

  describe 'index' do
    let(:fixture) { Fixture.create(week_id: week.id, name: 'ARG-BRA', home_team_id: home_team.id, away_team_id: away_team.id, kickoff: 1.days.ago) }
    let(:home_team) { Team.create(name: 'Argentina', abbreviation: 'arg') }
    let(:away_team) { Team.create(name: 'Brazil', abbreviation: 'bra') }
    let(:week) { Week.create(description: 'Week 01', close_date: 1.days.ago) }

    let!(:event_one) { Event.create(fixture_id: fixture.id, event_type: 'goal', team: 'visitorteam', player_name: 'Neymar', minute: 20) }
    let!(:event_two) { Event.create(fixture_id: fixture.id, event_type: 'goal', team: 'localteam', player_name: 'Aguero', minute: 10) }
    let(:events) { [event_one,event_two] }

    it 'should be successful' do
      get :index, week_id: week.id, fixture_id: fixture.id
      response.should be_success
    end

    it 'should fetch fixture' do
      Fixture.should_receive(:find).with(fixture.id).and_return(fixture)
      get :index, week_id: week.id, fixture_id: fixture.id
    end

    it 'should fetch events for fixture' do
      Fixture.stub(:find).and_return(fixture)
      fixture.should_receive(:events).and_return(events)
      events.should_receive(:order).with(:minute).and_return([event_two, event_one])
      get :index, week_id: week.id, fixture_id: fixture.id
    end

  end
end
