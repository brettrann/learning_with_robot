require 'Robot'
require 'Table'

class Simulator
  
  def initialize()
    @command = @args = nil
    @robot = Robot.new()
    @table = Table.new()
  end

  def execute(line)
    @command, @args = parse_line(line)
    case @command
      when 'right'
        return unless @robot.table
        @robot.rotate_right()
      when 'left'
        return unless @robot.table
        @robot.rotate_left()
      when 'move'
        return unless @robot.table
      when 'report'
        return unless @robot.table
        x, y, heading = @table.x, @table.y, @robot.heading
        return "#{x},#{y},#{heading}".upcase
      when 'place'
        x, y, heading = @args.split(/,/)
        x, y = x.to_i, y.to_i
        @robot.heading = heading.to_sym
        @table.place(@robot, x, y)
    end
  end

  def parse_line(line)
    # intending to create command objcts later so hack hack
    @command, @args = line.downcase.match(/^(\w+)(?:\s+(.*))?$/).captures
  end

end
