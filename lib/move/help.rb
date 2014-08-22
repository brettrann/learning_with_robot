require 'Robot'

class Help < Move

  attr_reader :regexp

  def initialize(args)
    @regexp = /^HELP$/i
    super(args)
  end

  def execute(command)
    return <<EOS
PLACE X,Y,[NORTH|EAST|SOUTH|WEST]
MOVE
LEFT
RIGHT
REPORT
EXIT
EOS
  end

end
