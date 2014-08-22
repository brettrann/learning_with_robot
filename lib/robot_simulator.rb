require "robot_simulator/version"
require 'Robot'
require 'Table'

class RobotSimulator
  
  def initialize()
    @command = @args = nil
    @robot = Robot.new()
    @table = Table.new()
  end

  def execute(line)
    @command, @args = parse_line(line)

    return unless @robot.table || @command =~ /^(?:place|help)$/
    case @command

      when 'right'
        @robot.rotate_right()

      when 'left'
        @robot.rotate_left()

      when 'move'
        # check bounds. might be useful to have a coord obj
        case @robot.heading
          when :north
            @table.y = @table.y+1
          when :south
            @table.y = @table.y-1
          when :east
            @table.x = @table.x+1
          when :west
            @table.x = @table.x-1
          end

      when 'report'
        x, y, heading = @table.x, @table.y, @robot.heading
        return "#{x},#{y},#{heading}".upcase

      when 'place'
        x, y, heading = @args.split(/,/)
        x, y = x.to_i, y.to_i
        res = @table.place(@robot, x, y)
        @robot.heading = heading.to_sym if res
        return res

      when 'help'
        return <<EOS
Commands:
Place X,Y,[NORTH|EAST|SOUTH|WEST]
MOVE
LEFT
RIGHT
REPORT
EXIT
EOS
    end
  end

  def parse_line(line)
    # intending to create command objcts later so hack hack
    @command, @args = line.downcase.match(/^(\w+)(?:\s+(.*))?$/).captures
  end

  if __FILE__ == $0
    simulator = RobotSimulator.new()
    puts 'shall we play a game?'
    while line = STDIN.gets do
      break if line =~ /^exit/
      res = simulator.execute(line)
      puts res if res =~ /(?:^\d+,\d+,\w+|Commands:)$/
    end
  end
end
