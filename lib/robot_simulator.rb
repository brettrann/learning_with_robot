require "robot_simulator/version"
require 'Robot'
require 'Table'
require 'Controller'
require 'Command'
require 'Command/turn_robot_left'
require 'Command/turn_robot_right'
require 'Command/place_robot'
require 'Command/move_robot'
require 'Command/report'
require 'Command/help'

class RobotSimulator

  def initialize()
    @controller = Controller.new
    [:TurnRobotRight, :TurnRobotLeft, :PlaceRobot, :MoveRobot, :Report, :Help].each do |command|
      Object.const_get(command).new controller: @controller
    end
  end

  def execute(line)
    @controller.execute line
  end

  private

  if __FILE__ == $0
    simulator = RobotSimulator.new
    puts 'shall we play a game?'
    while line = STDIN.gets.chomp do
      next if line.length == 0
      break if line =~ /^exit/
      res = simulator.execute line
      puts res if res =~ /(?:^\d+,\d+,\w+|USAGE:)$/
    end
  end
end
