require 'Move'
require 'Move/turn_robot_left'
require 'Table'
require 'Robot'

describe 'Move object' do

    it 'tests move abstract class' do
      move = Move.new
      expect{move.execute('irrelevant command')}.to raise_error NotImplementedError
    end
    it 'tests move left' do
      table = Table.new
      robot = Robot.new
      expect(robot.heading = :north).to eq :north
      left = TurnRobotLeft.new(robot: robot, table: table)
      expect(left.execute('LEFT')).to eq :west
    end

end
