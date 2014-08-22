require 'Table'
require 'Robot'

class Move

  attr_accessor :table, :robot

  def initialize(robot: Robot.new, table: Table.new, controller: nil)
    @robot, @table = robot, table
    controller.register_move(self) if controller.is_a?(Controller)
  end

  def execute(command)
  end

  def regexp=()
    return //
  end

  def is_active()
    @robot.heading && @table.robot
  end
end
