require 'Robot'
require 'Move'

class MoveRobot < Move

  Regexp = /^MOVE$/i

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

  def regexp()
    return Regexp
  end
end
