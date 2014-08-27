require 'Command'

class Command::TurnRobotLeft < Command

  Regexp = /^LEFT$/i

  def execute(command)
    @robot.rotate_left
  end
end
