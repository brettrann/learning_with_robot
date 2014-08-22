require 'spec_helper'
#XXX todo why is require 'RobotSimulator'  not working but it works for say require 'Robot'
# maybe require is doing some clever stuff with converting between cap styles...
require 'robot_simulator'

describe 'Simulator object' do

  @simulator
  before :each do
    @simulator = RobotSimulator.new()
  end

  it 'ignore command when robot not placed' do
    expect(@simulator.execute('MOVE'  )).to equal(nil)
    expect(@simulator.execute('RIGHT' )).to equal(nil)
    expect(@simulator.execute('LEFT'  )).to equal(nil)
    expect(@simulator.execute('REPORT')).to equal(nil)
  end

  it 'place robot on table' do
    expect(@simulator.execute('PLACE 2,2,NORTH')).to be_a(Robot)
    expect(@simulator.execute('REPORT'         )).to eq('2,2,NORTH')
  end

  it 'place robot on table with invalid coordinates' do
    expect(@simulator.execute('PLACE 5,5,NORTH')).to equal(nil)
    expect(@simulator.execute('REPORT'         )).to equal(nil)
  end

  it 'place robot on table with invalid heading' do
    expect(@simulator.execute('PLACE 5,5,NORTHWEST')).to equal(nil)
    expect(@simulator.execute('REPORT'             )).to equal(nil)
  end

  it 'rotate robot' do
    expect(@simulator.execute('PLACE 2,2,NORTH')).to be_a(Robot)
    expect(@simulator.execute('REPORT'         )).to eq('2,2,NORTH')
    expect(@simulator.execute('LEFT')           ).to equal(:west)
    expect(@simulator.execute('RIGHT')          ).to equal(:north)
  end

  it 'move robot' do
    expect(@simulator.execute('PLACE 2,2,NORTH')).to be_a(Robot)
    expect(@simulator.execute('REPORT'         )).to eq('2,2,NORTH')
    expect(@simulator.execute('MOVE'           )).to equal 3
    expect(@simulator.execute('REPORT'         )).to eq('2,3,NORTH')
  end

  it 'check table bounds' do
    expect(@simulator.execute('PLACE 0,0,NORTH')).to be_a(Robot)
    expect(@simulator.execute('REPORT'         )).to eq('0,0,NORTH')
    expect(@simulator.execute('LEFT'           )).to equal :west
    # boundary move
    expect(@simulator.execute('MOVE'           )).to equal -1
    expect(@simulator.execute('REPORT'         )).to eq('0,0,WEST')
    expect(@simulator.execute('RIGHT'           )).to equal :north
    for i in 1..4 do
      expect(@simulator.execute('MOVE'           )).to equal i
    end
    # boundary move
    expect(@simulator.execute('REPORT'         )).to eq('0,4,NORTH')
    expect(@simulator.execute('MOVE'           )).to equal 5
    expect(@simulator.execute('REPORT'         )).to eq('0,4,NORTH')

    expect(@simulator.execute('RIGHT'           )).to equal :east
    for i in 1..4 do
      expect(@simulator.execute('MOVE'           )).to equal i
    end
    #boundary move
    expect(@simulator.execute('REPORT'         )).to eq('4,4,EAST')
    expect(@simulator.execute('MOVE'           )).to equal 5
    expect(@simulator.execute('REPORT'         )).to eq('4,4,EAST')

    expect(@simulator.execute('RIGHT'           )).to equal :south
    for i in [3, 2, 1, 0] do
      expect(@simulator.execute('MOVE'           )).to equal i
    end
    #boundary move
    expect(@simulator.execute('REPORT'         )).to eq('4,0,SOUTH')
    expect(@simulator.execute('MOVE'           )).to equal -1
    expect(@simulator.execute('REPORT'         )).to eq('4,0,SOUTH')
  end
end
