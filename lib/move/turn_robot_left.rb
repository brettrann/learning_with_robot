require 'Robot'

class TurnRobotLeft < Move

  def execute(arguments=nil)
    @robot.rotate_left()
  end

  def regexp()
    return /^LEFT$/i
  end

end
