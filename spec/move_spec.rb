require 'Move'
require 'Move/TurnRobotLeft'
require 'Table'
require 'Robot'

describe 'Move object' do

    # not sure yet how to test abstract classes...
    left = Move::TurnRobotLeft.new
    robot = Robot.new
    table = Table.new
    expect(robot.heading(:north)).to eq :north
    expect(left.do($robot)) to eq :north

end
