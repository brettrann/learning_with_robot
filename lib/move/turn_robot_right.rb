require 'Move'

class TurnRobotRight < Move

  attr_reader :regexp

  def initialize(args)
    @regexp = /^RIGHT$/i
    super(args)
  end

  def execute(command)
    @robot.rotate_right()
  end

end
