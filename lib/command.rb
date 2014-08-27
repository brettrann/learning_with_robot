require 'Table'
require 'Robot'
require 'Controller'

class Command

  attr_accessor :table, :robot
  attr_reader :Regexp

  def initialize(robot: Robot.new, table: Table.new, controller: nil)
    if controller
      controller.register_command self
    else
      @robot, @table = robot, table
    end
  end

  def execute(command)
    raise NotImplementedError.new("#{self.class}.execute is abstract and must be implemented in a subclass")
  end

  def is_active?
    @robot.heading
  end
end
