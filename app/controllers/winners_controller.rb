class WinnersController < ApplicationController
  before_filter :require_login

  def index
    set_common
    @week_ids_by_month = @hash
  end

  def show
    @month_id = params['id'].to_i
    @current_user = current_user
    set_common
    @week_ids_for_month = @hash[@month_id]
  end

  private

  def set_common
    @hash = {}
    @points = Points::HdaPoint.total_points_by_week
    @weeks = Week.sorted
    @weeks.each do |w|
      @hash[w.close_date.month].nil? ? @hash[w.close_date.month] = [w.id] : @hash[w.close_date.month] << w.id
    end
  end

end
