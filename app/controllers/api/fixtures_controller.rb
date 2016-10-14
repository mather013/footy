module Api
  class FixturesController < ApplicationController

    def add_score
      result = false
      if params_valid(params) && authorised_user(params['username'])
        fixture = Fixture.find_by_name(params['name'].upcase)
        home_goals = params['score'].split("-").first.to_i
        away_goals = params['score'].split("-").last.to_i
        record_score(fixture, home_goals, away_goals)
        result = fixture.update_attributes(status: Fixture::Status::FINISHED)
      end

      render status: 200, json: params.merge(result: result).to_json
    end

    private

    def params_valid(params)
      params['name'].present? && params['score'].present? && params['username'].present?
    end

    def authorised_user(username)
      username == 'markm'
    end

    def record_score(fixture, home_goals, away_goals)
      if fixture.score.present?
        fixture.score.update_attributes(home: home_goals, away: away_goals)
      else
        fixture.create_score(home: home_goals, away: away_goals)
      end
    end

  end
end
