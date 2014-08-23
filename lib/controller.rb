require 'Robot'
require 'Table'

class Controller

  attr_accessor :table, :robot

  def initialize(robot: Robot.new, table: Table.new)
    @robot, @table, @moves = robot, table, {}
  end

  def execute(command)
    for regexp in @moves.keys
      return @moves[regexp].execute(command) if command.match(regexp)
    end
    return nil
  end

  def register_move(move)
    move.robot, move.table = @robot, @table
    @moves[move.class::Regexp] = move if move.class::Regexp.is_a?(Regexp)
  end

end
