require 'Robot'

class TurnRobotLeft < Move

  Regexp = /^LEFT$/i

  def execute(command)
    @robot.rotate_left()
  end

end
