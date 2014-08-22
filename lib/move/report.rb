#TODO test if require needed when inheriting Move which has it
require 'Robot'

class Report < Move

  attr_reader :regexp

  def initialize(args)
    @regexp = /^REPORT$/
    super(args)
  end

  def execute(command)
    return "#{@table.x},#{@table.y},#{@robot.heading}".upcase if self.is_active
  end

end
