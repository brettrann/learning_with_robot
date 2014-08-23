require 'Robot'

class Help < Move

  Regexp = /^HELP$/i

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
