#TODO test if require needed when inheriting Move which has it
require 'Robot'

class PlaceRobot < Move

  attr_reader :regexp

  def initialize(args)
    @regexp = /^PLACE\s+(\d+),\s*(\d+),\s*(NORTH|EAST|SOUTH|WEST)$/i
    super(args)
  end

  def execute(command)
    x, y, heading = command.downcase.match(@regexp).captures
    res = @table.place(@robot, x.to_i, y.to_i)
    @robot.heading = heading.to_sym if res
    return res
  end

end
