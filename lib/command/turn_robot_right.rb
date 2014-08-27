require 'Command'

class Command::TurnRobotRight < Command

  Regexp = /^RIGHT$/i

  def execute(command)
    @robot.rotate_right
  end
end
