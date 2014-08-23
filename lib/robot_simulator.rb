require "robot_simulator/version"
require 'Robot'
require 'Table'
require 'Controller'
require 'Move'
require 'Move/turn_robot_left'
require 'Move/turn_robot_right'
require 'Move/place_robot'
require 'Move/move_robot'
require 'Move/report'
require 'Move/help'

class RobotSimulator

  def initialize()
    @controller = Controller.new
    right       = TurnRobotRight.new controller: @controller
    left        = TurnRobotLeft.new  controller: @controller
    place       = PlaceRobot.new     controller: @controller
    move        = MoveRobot.new      controller: @controller
    report      = Report.new         controller: @controller
    help        = Help.new           controller: @controller
  end

  def execute(line)
    @controller.execute line
  end

  private

  if __FILE__ == $0
    simulator = RobotSimulator.new()
    puts 'shall we play a game?'
    while line = STDIN.gets.chomp do
      next if line.length == 0
      break if line =~ /^exit/
      res = simulator.execute(line)
      puts res if res =~ /^(?:^\d+,\d+,\w+|PLACE)/
    end
  end
end
