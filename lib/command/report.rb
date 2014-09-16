require 'command'

class Command::Report < Command

  Regexp = /^REPORT$/i

  def execute(command)
    return "#{@robot.point.x},#{@robot.point.y},#{@robot.heading}".upcase if is_active?
  end
end
