require 'Robot'
class Table
  
  attr_reader :x, :y

  def initialize(max_x = 5, max_y = 5)
    @max_x, @max_y   = max_x, max_y
    @x = @y = @robot = nil
  end

  def place(robot, x, y)
    if robot.is_a?(Robot) && in_range(x, y)
      @x, @y = x, y
      # XXX using this as success return value. bad, need better.
      @robot = robot
    end
  end

  # XXX these are returning x even when the if fails.
  # so checking for that in test,but it is strange.
  def x=(x)
    @x = x if self.in_range(x, @y)
  end

  def y=(y)
    @y = y  if self.in_range(@x, y)
  end

  def in_range(x, y)
    x >= 0 && x < @max_x && y >= 0 && y < @max_x
  end
end
