require 'robot'
require 'table'

class Controller

  attr_accessor :table, :robot

  def initialize(robot: Robot.new, table: Table.new)
    @robot, @table, @commands = robot, table, {}
  end

  def execute(command)
    for regexp in @commands.keys
      return @commands[regexp].execute command if command.match regexp
    end
    nil
  end

  def register_command(command)
    command.robot, command.table = @robot, @table
    @commands[command.class::Regexp] = command if command.class::Regexp.is_a? Regexp
  end
end
