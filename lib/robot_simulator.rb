require "robot_simulator/version"
require 'robot'
require 'table'
require 'controller'
require 'command'
require 'command/turn_robot_left'
require 'command/turn_robot_right'
require 'command/place_robot'
require 'command/move_robot'
require 'command/report'
require 'command/help'

class RobotSimulator

  def initialize()
    @controller = Controller.new
    [:TurnRobotRight, :TurnRobotLeft, :PlaceRobot, :MoveRobot, :Report, :Help].each do |command|
      Command.const_get(command).new controller: @controller
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
      puts res if res =~ /^(?:\d+,\d+,\w+|USAGE:)$/
    end
  end
end
