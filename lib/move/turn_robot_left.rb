require 'Robot'

class TurnRobotLeft < Move

  attr_reader :regexp

  def initialize(args)
    @regexp = /^LEFT$/i
    super(args)
  end

  def execute(command)
    @robot.rotate_left()
  end

end