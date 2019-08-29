class LpPoint < ActiveRecord::Base

  def add_points(points)
    new_value = self.value + points
    self.update_attributes!(value: new_value)
  end

end
