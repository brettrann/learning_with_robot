require 'controller'
require 'command'
require 'command/turn_robot_left'
require 'command/turn_robot_right'
require 'command/place_robot'
require 'command/move_robot'
require 'command/report'
require 'command/help'
require 'robot'
require 'table'

describe 'Controller object' do

  before :each do
    @controller = Controller.new
    right       = Command::TurnRobotRight.new controller: @controller
    place       = Command::PlaceRobot.new     controller: @controller
    move        = Command::MoveRobot.new      controller: @controller
    left        = Command::TurnRobotLeft.new  controller: @controller
    report      = Command::Report.new         controller: @controller
    help        = Command::Help.new           controller: @controller
  end

  it 'create a new controller using explicits' do
    robot = Robot.new()
    table = Table.new()
    expect(controller = Controller.new(robot: robot, table: table)).to be_a Controller
    expect(controller.table).to be table
    expect(controller.robot).to be robot
  end

  it 'ignore command when robot not placed' do
    expect(@controller.execute('MOVE'  )).to equal(nil)
    expect(@controller.execute('RIGHT' )).to equal(nil)
    expect(@controller.execute('LEFT'  )).to equal(nil)
    expect(@controller.execute('REPORT')).to equal(nil)
  end

  it 'place robot on table' do
    expect(@controller.execute('PLACE 2,2,NORTH')).to be_truthy
    expect(@controller.execute('REPORT'         )).to eq('2,2,NORTH')
  end

  it 'place robot on table with invalid coordinates' do
    expect(@controller.execute('PLACE 5,5,NORTH')).to equal(nil)
    expect(@controller.execute('REPORT'         )).to equal(nil)
  end

  it 'place robot on table with invalid heading' do
    expect(@controller.execute('PLACE 5,5,NORTHWEST')).to equal(nil)
    expect(@controller.execute('REPORT'             )).to equal(nil)
  end

  it 'rotate robot' do
    expect(@controller.execute('PLACE 2,2,NORTH')).to be_truthy
    expect(@controller.execute('REPORT'         )).to eq('2,2,NORTH')
    expect(@controller.execute('LEFT')           ).to equal(:west)
    expect(@controller.execute('RIGHT')          ).to equal(:north)
  end

  it 'move robot' do
    expect(@controller.execute('PLACE 2,2,NORTH')).to be_truthy
    expect(@controller.execute('REPORT'         )).to eq('2,2,NORTH')
    expect(@controller.execute('MOVE'           )).to be_a Point
    expect(@controller.execute('REPORT'         )).to eq('2,3,NORTH')
  end

  it 'check table bounds' do
    expect(@controller.execute('PLACE 0,0,NORTH')).to be_truthy
    expect(@controller.execute('REPORT'         )).to eq('0,0,NORTH')
    expect(@controller.execute('LEFT'           )).to equal :west
    # boundary move
    expect(@controller.execute('MOVE'           )).to be_falsey
    expect(@controller.execute('REPORT'         )).to eq('0,0,WEST')
    expect(@controller.execute('RIGHT'          )).to equal :north
    for i in 1..4 do
      expect(@controller.execute('MOVE')).to be_a Point
    end
    # boundary move
    expect(@controller.execute('REPORT'         )).to eq('0,4,NORTH')
    expect(@controller.execute('MOVE'           )).to be_falsey
    expect(@controller.execute('REPORT'         )).to eq('0,4,NORTH')

    expect(@controller.execute('RIGHT'          )).to equal :east
    for i in 1..4 do
      expect(@controller.execute('MOVE')).to be_a Point
    end
    #boundary move
    expect(@controller.execute('REPORT'         )).to eq('4,4,EAST')
    expect(@controller.execute('MOVE'           )).to be_falsey
    expect(@controller.execute('REPORT'         )).to eq('4,4,EAST')

    expect(@controller.execute('RIGHT'          )).to equal :south
    for i in [3, 2, 1, 0] do
      expect(@controller.execute('MOVE')).to be_a Point
    end
    #boundary move
    expect(@controller.execute('REPORT'         )).to eq('4,0,SOUTH')
    expect(@controller.execute('MOVE'           )).to be_falsey
    expect(@controller.execute('REPORT'         )).to eq('4,0,SOUTH')
  end
end
