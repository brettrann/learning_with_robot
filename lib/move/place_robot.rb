require 'Robot'

class PlaceRobot < Move

  Regexp = /^PLACE\s+(\d+),\s*(\d+),\s*(NORTH|EAST|SOUTH|WEST)$/i

  def execute(command)
    x, y, heading = command.downcase.match(Regexp).captures
    res = @table.place(@robot, x.to_i, y.to_i)
    @robot.heading = heading.to_sym if res
    return res
  end

end
