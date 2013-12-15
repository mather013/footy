class BetsController < ApplicationController
  #before_filter :require_login

  def new
    @fixture = Fixture.find(params["fixture_id"])
    #load_competition
    #bet_id = current_user.bets.for(@competition).first.id if current_user.bets.for(@competition).present?
    #redirect_to competition_bet_path(@competition.id, bet_id) unless bet_id.nil?
    #redirect_to competition_bet_path(@competition.id, -1) if ((@competition.close_date < DateTime.now) && bet_id.nil?)
  end

  def create
    binding.pry
    #load_competition
    #bet = Bet.new(:competition_id => @competition.id, :user_id => current_user.id)
    #
    #params[:choices].values.each do |choice|
    #  bet.choices << Choice.new(:competition_fixture_id => choice[:competition_fixture_id], :value => choice[:value])
    #end
    #
    #if bet.save!
    #  render :json => {:redirect => competition_bet_path(@competition.id, bet.reload.id)}
    #end
  end
end
