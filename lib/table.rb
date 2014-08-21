require 'Robot'
class Table

  def initialize(max_x = 5, max_y = 5)
    @max_x = max_x
    @max_y = max_y
    @x = @y = @robot = nil
  end

  def place(robot, x, y)
    if robot.is_a?(Robot) && in_range(x, y)
      @x = x
      @y = y
      # XXX undecided still on has_a etc relationships. cross linking until I decide
      robot.table = self
      puts "place set robot.table to:", robot.table
      # XXX using this as success return value. bad, need better.
      @robot = robot
    end
  end

  def in_range(x, y)
    x >= 0 && x < @max_x && y >= 0 && y < @max_x
  end
end
