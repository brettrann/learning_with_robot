require "robot_simulator/version"

module RobotSimulator

  # super duper hack procedural version
  # since I am learning ruby syntax i'm taking this approach:
  # procedural hack to get a mental map of the workings
  # refactor to rubify the code
  # first refactor will put command processing into a function call and then build tests
  # ( knowing that tests should be first. but im familiar with basic ruby syntax more than test syntax,
  #   so will reverse that just for the initial run. )
  # then all the other goodies. objects for robot, table, maybe moves, command processing etc
  # and maybe some error handling

  def RobotSimulator.init()
    # 5x5 table
    @max_x = @max_y = 5

    # robot
    @directions = ['north', 'east', 'south', 'west']
    @r_heading = nil
    @r_x = @r_y = nil
  end


  def RobotSimulator.execute(command, argstr)
    command = command.downcase
    argstr = argstr.downcase if argstr
    case command

    # PLACE x,y,f - coords and facing direction
      when 'place'
        x, y, heading = argstr.split(/,/)
        x, y = x.to_i, y.to_i
        if  ( x >= 0 && x < @max_x && y >= 0 && y < @max_y && ( @directions.index(heading) != nil ) )
          @r_x = x
          @r_y = y
          @r_heading = heading
        end

      # MOVE - move one space forward
      when 'move'
        return unless @r_heading

        case @r_heading
            when 'north'
              @r_y += 1 if @r_y < @max_x-1
            when 'east'
              @r_x += 1 if @r_x < @max_y-1
            when 'south'
              @r_y -= 1 if @r_y > 0
            when 'west'
              @r_x -= 1 if @r_x > 0
        end

      # LEFT - rotate 90 degrees to the left
      when 'left'
        return unless @r_heading

        @r_heading = @directions[@directions.index(@r_heading)-1]
        
      # RIGHT - rotate 90 degress to the right
      when 'right'
        return unless @r_heading

        @r_heading = @directions[(@directions.index(@r_heading)+2) % 4 - 1]
      
      # REPORT - report: Output:x,y,[NORTH|SOUTH|EAST|WEST]
      when 'report'
        return unless @r_heading

        return "#{@r_x},#{@r_y},#{@r_heading.upcase}"
    end
    return nil
  end

  if __FILE__ == $0
    init()
    puts 'shall we play a game?'
    while line = STDIN.gets do
      line = line.chomp
      next if line.length == 0
      command, argstr = line.downcase.match(/^(\w+)(?:\s+(.*))?$/).captures
      break if command == 'exit'
      val = RobotSimulator.execute(command, argstr)
      puts val if val
    end
  end
end
