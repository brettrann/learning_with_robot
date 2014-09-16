require 'command'

class Command::MoveRobot < Command

  Regexp = /^MOVE$/i

  def execute(command)
    return unless is_active?
    desired_point = @robot.desired_move
    if @table.contains? desired_point
      return robot.point = desired_point
    end
  end
end
