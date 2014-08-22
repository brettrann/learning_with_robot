require 'Robot'
class Table
  
  attr_reader :x
  attr_reader :y

  def initialize(max_x = 5, max_y = 5)
    @max_x = max_x
    @max_y = max_y
    @x = @y = @robot = nil
  end

  def place(robot, x, y)
    if robot.is_a?(Robot) && in_range(x, y)
      @x = x
      @y = y
      # XXX using this as success return value. bad, need better.
      @robot = robot
    end
  end

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
