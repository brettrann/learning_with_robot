require 'Command'

class Command::PlaceRobot < Command

  HeadingsRE = Robot::Headings.join('|').upcase.to_sym
  Regexp = /^PLACE\s+(\d+),\s*(\d+),\s*(#{HeadingsRE})$/i

  def execute(command)
    x, y, heading = command.downcase.match(Regexp).captures
    point = Point.new(x.to_i, y.to_i)
    if @table.contains? point
      @robot.point = point
      @robot.heading = heading.to_sym
      true
    end
  end
end
