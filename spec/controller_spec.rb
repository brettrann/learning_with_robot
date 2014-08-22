require 'Controller'
require 'Robot'
require 'Table'

describe 'Controller object' do

  it 'create a new controller using defaults' do
    expect(controller = Controller.new()).to be_a Controller
    expect(controller.table).to be_a Table
    expect(controller.robot).to be_a Robot
  end

  it 'create a new controller using explicits' do
    robot = Robot.new()
    table = Table.new()
    expect(controller = Controller.new(robot: robot, table: table)).to be_a Controller
    expect(controller.table).to be table
    expect(controller.robot).to be robot
  end

  it 'execute command' do
    controller = Controller.new
    expect(controller.execute('foo', 'bar')).to eq nil # no commands yet!

  end

end
