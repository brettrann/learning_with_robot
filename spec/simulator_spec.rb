require 'spec_helper'
require 'Simulator'

describe 'Simulator object' do
  
  @simulator
  before :each do
    @simulator = Simulator.new()
  end

  it 'ignore command when robot not placed' do
    expect(@simulator.execute('MOVE'  )).to equal(nil)
    expect(@simulator.execute('RIGHT' )).to equal(nil)
    expect(@simulator.execute('LEFT'  )).to equal(nil)
    expect(@simulator.execute('REPORT')).to equal(nil)
  end

  it 'place robot on table' do
    expect(@simulator.execute('PLACE 2,2,NORTH')).to be_a(Robot)
  end

  it 'rotate robot' do
    expect(@simulator.execute('PLACE 2,2,NORTH')).to be_a(Robot)
    expect(@simulator.execute('LEFT')).to equal(:west)
    expect(@simulator.execute('RIGHT')).to equal(:north)
  end

end
