require 'Robot'
require 'Table'

class Controller

  attr_accessor :table, :robot

  def initialize(robot: Robot.new, table: Table.new)
    @robot, @table = robot, table
    @moves = {}
  end

  def execute(command)
    for regexp in @moves.keys
      return @moves[regexp].execute(command) if command.match(regexp)
    end
    return nil
  end

  def register_move(move)
    return unless move.is_a?(Move)
    move.robot = @robot
    move.table = @table
    if move.is_a?(TurnRobotLeft)
    end
    @moves[move.regexp] = move
  end

end
