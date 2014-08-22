require 'Robot'
require 'Table'

class Controller

  attr_accessor :table, :robot

  def initialize(robot: Robot.new, table: Table.new)
    @robot, @table = robot, table
  end

  def execute(command, arguments=nil)
  end

end
