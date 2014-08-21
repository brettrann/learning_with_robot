require 'spec_helper'
# XXX this below require doesn't seem necessary in online examples. config missing?
require './lib/robot.rb'

describe "Robot object" do

  @robot
  before :each do
    @robot = Robot.new()
  end

  it 'when setting the heading' do
    expect(@robot.heading(:north)).to equal :north
    expect(@robot.heading(:east )).to equal :east
    expect(@robot.heading(:south)).to equal :south
    expect(@robot.heading(:west )).to equal :west
    expect(@robot.heading(:oops )).to equal nil
  end

  it 'when rotating right' do
    expect(@robot.rotate_right()).to equal nil
    expect(@robot.heading(:north)).to equal :north
    expect(@robot.rotate_right()).to equal :east
    expect(@robot.rotate_right()).to equal :south
    expect(@robot.rotate_right()).to equal :west
    expect(@robot.rotate_right()).to equal :north
  end

  it 'when rotating left' do
    expect(@robot.rotate_left()).to equal nil
    expect(@robot.heading(:north)).to equal :north
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
