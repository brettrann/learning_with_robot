require 'spec_helper'
require 'Robot'
require 'Table'

describe "Table object" do

  @robot
  @table
  before :each do
    @robot = Robot.new()
    @table = Table.new()
  end

  it 'when placing the robot' do
    expect(@table.place(@robot, 0, 0)).to equal @robot
    expect(@table.x                  ).to equal 0
    expect(@table.y                  ).to equal 0
    expect(@table.place(@robot, 4, 4)).to equal @robot
    expect(@table.x                  ).to equal 4
    expect(@table.y                  ).to equal 4
    expect(@table.place(@robot, 9, 9)).to equal nil
    expect(@table.place(@robot, 5, 0)).to equal nil
    expect(@table.place(@robot, 0, 5)).to equal nil

    @table = Table.new(100,100)
    expect(@table.place(@robot,  99,  99)).to equal @robot
    expect(@table.x                      ).to equal 99
    expect(@table.y                      ).to equal 99
    expect(@table.place(@robot, 100,  99)).to equal nil
    expect(@table.place(@robot, 100, 100)).to equal nil
  end
end
