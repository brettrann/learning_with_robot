require 'Command'

class Command::Help < Command

  Regexp = /^HELP$/i

  def execute(command)
    return <<-EOS.strip
    USAGE:
    PLACE X,Y,[NORTH|EAST|SOUTH|WEST]
    MOVE
    LEFT
    RIGHT
    REPORT
    EXIT
    EOS
  end
end
