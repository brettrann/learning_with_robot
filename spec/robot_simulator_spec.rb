require 'spec_helper'
#XXX todo why is require 'RobotSimulator'  not working but it works for say require 'Robot'
# maybe require is doing some clever stuff with converting between cap styles...
require 'robot_simulator'

describe 'Simulator object' do

  @simulator
  before :each do
    @simulator = RobotSimulator.new()
  end

  # TODO test STDIN
end
