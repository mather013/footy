class WinnersController < ApplicationController
  before_filter :require_login

  def index
    @points = Point.total_points_by_week
    hash = {}
    @weeks = Week.sorted
    @weeks.each { |w| hash[w.close_date.month].nil? ? hash[w.close_date.month] = [w.id] : hash[w.close_date.month] << w.id }
    @week_ids_by_month = hash
  end

end
