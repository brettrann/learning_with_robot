require 'Robot'

class Report < Move

<<<<<<< HEAD
  Regexp = /^REPORT$/i
=======
  Regexp = /^REPORT$/
>>>>>>> e9495566b3819b30d8f736e3825cdb66a5fc7fe1

  def execute(command)
    return "#{@table.x},#{@table.y},#{@robot.heading}".upcase if self.is_active
  end

end
