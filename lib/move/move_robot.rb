require 'Robot'
require 'Move'

class MoveRobot < Move

  attr_reader :regexp

  def initialize(args)
    @regexp = /^MOVE$/i
    super(args)
  end

  def execute(command)

    # TODO test this line
    return unless is_active()

    case @robot.heading
      when :north
        @table.y = @table.y+1
      when :south
        @table.y = @table.y-1
      when :east
        @table.x = @table.x+1
      when :west
        @table.x = @table.x-1
      end
  end
end
