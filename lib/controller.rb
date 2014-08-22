require 'Robot'
require 'Table'

class Controller

  attr_accessor :table, :robot

  def initialize(robot: Robot.new, table: Table.new)
    @robot, @table = robot, table
    @moves = {}
  end

  def execute(command, arguments=nil)
    for regexp in @moves.keys
      return @moves[regexp].execute(arguments) if command.match(regexp)
    end
    return nil
  end

  def register_move(move)
    # XXX WTF? undefined method 'is_a' for #<TurnRobotLeft:8xx9x9x80etc> wtf?
    #return nil unless move.is_a Move
    @moves[move.regexp] = move
  end

end
