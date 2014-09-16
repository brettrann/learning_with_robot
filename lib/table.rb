require 'point'
class Table

  attr_reader :bottom_left_point, :top_right_point

  def initialize(max_x = 5, max_y = 5)
    @bottom_left_point = Point.new(0, 0)
    @top_right_point = Point.new(max_x-1, max_y-1)
  end

  def contains?(point)
    # in bigger 2d libraries it would generally be in a 2d bound object
    # which this would extend, but in that absence it is living in Point
    # so putting this as a wrapper
    point.inside? @bottom_left_point, @top_right_point
  end
end
