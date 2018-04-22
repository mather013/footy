class TeamStatsFull < TeamStats

  private

  def weeks
    Week.all
  end

end
