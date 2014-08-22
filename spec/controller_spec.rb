require 'Controller'
require 'Move'
require 'Move/turn_robot_left'
require 'Robot'
require 'Table'

describe 'Controller object' do

  before :each do
    @controller = Controller.new
  end

  it 'create a new controller using explicits' do
    robot = Robot.new()
    table = Table.new()
    expect(controller = Controller.new(robot: robot, table: table)).to be_a Controller
    expect(controller.table).to be table
    expect(controller.robot).to be robot
  end

  it 'execute command' do
    robot = Robot.new()
    table = Table.new()
    robot.heading = :north
    controller = Controller.new(robot: robot, table:table)
    left = TurnRobotLeft.new(robot: robot, table:table)
    expect(controller.register_move(left)).to eq left
    expect(controller.execute('LEFT')).to eq :west
    expect(controller.execute('foo')).to eq nil # no commands yet!
    expect(controller.execute('foo', 'bar')).to eq nil # no commands yet!
  end


  it 'ignore command when robot not placed' do
    expect(@controller.execute('MOVE'  )).to equal(nil)
    expect(@controller.execute('RIGHT' )).to equal(nil)
    expect(@controller.execute('LEFT'  )).to equal(nil)
    expect(@controller.execute('REPORT')).to equal(nil)
  end

  it 'place robot on table' do
    expect(@controller.execute('PLACE 2,2,NORTH')).to be_a(Robot)
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
    expect(@controller.execute('PLACE 2,2,NORTH')).to be_a(Robot)
    expect(@controller.execute('REPORT'         )).to eq('2,2,NORTH')
    expect(@controller.execute('LEFT')           ).to equal(:west)
    expect(@controller.execute('RIGHT')          ).to equal(:north)
  end

  it 'move robot' do
    expect(@controller.execute('PLACE 2,2,NORTH')).to be_a(Robot)
    expect(@controller.execute('REPORT'         )).to eq('2,2,NORTH')
    expect(@controller.execute('MOVE'           )).to equal 3
    expect(@controller.execute('REPORT'         )).to eq('2,3,NORTH')
  end

  it 'check table bounds' do
    expect(@controller.execute('PLACE 0,0,NORTH')).to be_a(Robot)
    expect(@controller.execute('REPORT'         )).to eq('0,0,NORTH')
    expect(@controller.execute('LEFT'           )).to equal :west
    # boundary move
    expect(@controller.execute('MOVE'           )).to equal -1
    expect(@controller.execute('REPORT'         )).to eq('0,0,WEST')
    expect(@controller.execute('RIGHT'           )).to equal :north
    for i in 1..4 do
      expect(@controller.execute('MOVE'           )).to equal i
    end
    # boundary move
    expect(@controller.execute('REPORT'         )).to eq('0,4,NORTH')
    expect(@controller.execute('MOVE'           )).to equal 5
    expect(@controller.execute('REPORT'         )).to eq('0,4,NORTH')

    expect(@controller.execute('RIGHT'           )).to equal :east
    for i in 1..4 do
      expect(@controller.execute('MOVE'           )).to equal i
    end
    #boundary move
    expect(@controller.execute('REPORT'         )).to eq('4,4,EAST')
    expect(@controller.execute('MOVE'           )).to equal 5
    expect(@controller.execute('REPORT'         )).to eq('4,4,EAST')

    expect(@controller.execute('RIGHT'           )).to equal :south
    for i in [3, 2, 1, 0] do
      expect(@controller.execute('MOVE'           )).to equal i
    end
    #boundary move
    expect(@controller.execute('REPORT'         )).to eq('4,0,SOUTH')
    expect(@controller.execute('MOVE'           )).to equal -1
    expect(@controller.execute('REPORT'         )).to eq('4,0,SOUTH')
  end
end
