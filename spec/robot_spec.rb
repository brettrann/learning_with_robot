require 'spec_helper'
require 'Robot'

describe "Robot object" do

  @robot
  before :each do
    @robot = Robot.new()
  end

  it 'when setting the heading' do
    @robot.heading = :north
    expect(@robot.heading).to equal :north
    @robot.heading = :east
    expect(@robot.heading).to equal :east
    @robot.heading = :south
    expect(@robot.heading).to equal :south
    @robot.heading = :west
    expect(@robot.heading).to equal :west
    @robot.heading = :oops
    expect(@robot.heading).to equal :west
  end

  it 'when rotating right' do
    expect(@robot.rotate_right()).to equal nil
    @robot.heading = :north
    expect(@robot.heading       ).to equal :north
    expect(@robot.rotate_right()).to equal :east
    expect(@robot.rotate_right()).to equal :south
    expect(@robot.rotate_right()).to equal :west
    expect(@robot.rotate_right()).to equal :north
  end

  it 'when rotating left' do
    expect(@robot.rotate_left()).to equal nil
    @robot.heading = :north
    expect(@robot.heading      ).to equal :north
    expect(@robot.rotate_left()).to equal :west
    expect(@robot.rotate_left()).to equal :south
    expect(@robot.rotate_left()).to equal :east
    expect(@robot.rotate_left()).to equal :north
  end

  it 'when assigning a table' do
    expect(@robot.table = Table.new()).to be_a Table
    expect(@robot.table).to be_a Table
  end
end
