require 'Robot'

class Report < Move

  Regexp = /^REPORT$/i

  def execute(command)
    return "#{@table.x},#{@table.y},#{@robot.heading}".upcase if self.is_active
  end

end
