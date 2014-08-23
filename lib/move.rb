require 'Table'
require 'Robot'

class Move

  attr_accessor :table, :robot
  attr_reader :Regexp

  def initialize(robot: Robot.new, table: Table.new, controller: nil)
    @robot, @table = robot, table
    ## TODO need "if controller &&" otherwise error. why is is_a working that way?
    controller.register_move(self) if controller && controller.is_a?(Controller)
  end

  def execute(command)
    raise NotImplementedError.new("#{self.class}.execute is abstract and must be called from a subclass instance")
  end

  def is_active()
    @robot.heading && @table.robot
  end

end
