require 'Move'

class TurnRobotRight < Move

  Regexp = /^RIGHT$/i

  def execute(command)
    @robot.rotate_right()
  end

end
