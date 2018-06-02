class GoalsController < ApplicationController
  before_action :require_login

  def all
    @goals = Goal.all_player_grouped_total_ordered
    @top_tally = Goal.top_tally.count
  end

  def index
    @fixture = Fixture.find(params['fixture_id'])
    @players = @fixture.home_team.players.position_order + @fixture.away_team.players.position_order
    @goals = @fixture.score.goals if @fixture.score.present?
  end

  def update
    @fixture = Fixture.find(params['fixture_id'])

    player_ids = params['player_ids'].split(',').map(&:to_i)

    if @fixture.present? && player_ids.present?
      @fixture.update_attributes(status: Fixture::Status::IN_PLAY) unless @fixture.status == Fixture::Status::FINISHED
      @fixture.create_score(home: 0, away: 0) if @fixture.score.nil?

      player_ids.each do |player_id|
        @fixture.score.goals.create(player_id: player_id) unless @fixture.score.goals.map(&:player_id).include?(player_id)
      end
    end
    @scorers = @fixture.score.goals.map(&:player).uniq
  end

end
