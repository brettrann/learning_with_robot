require 'spec_helper'

describe "Robot Simulator" do

  RobotSimulator.init()

  describe 'place and report:' do
    it 'when placing the robot' do
      expect(RobotSimulator.execute("PLACE", "1,1,NORTH")).to equal nil
    end
    it 'when reporting the position' do
      expect(RobotSimulator.execute('REPORT', nil)).to match /^1,1,NORTH$/
    end
  end

  describe 'rotate right' do
    it 'when placing the robot' do
      expect(RobotSimulator.execute("PLACE", "2,2,NORTH")).to equal nil
    end
    it 'when rotating the robot' do
      expect(RobotSimulator.execute("RIGHT", nil)).to equal nil
    end
    it 'when reporting the position' do
      expect(RobotSimulator.execute('REPORT', nil)).to match /^2,2,EAST$/
    end
    it 'when rotating the robot' do
      expect(RobotSimulator.execute("RIGHT", nil)).to equal nil
    end
    it 'when reporting the position' do
      expect(RobotSimulator.execute('REPORT', nil)).to match /^2,2,SOUTH$/
    end
    it 'when rotating the robot' do
      expect(RobotSimulator.execute("RIGHT", nil)).to equal nil
    end
    it 'when reporting the position' do
      expect(RobotSimulator.execute('REPORT', nil)).to match /^2,2,WEST$/
    end
    it 'when rotating the robot' do
      expect(RobotSimulator.execute("RIGHT", nil)).to equal nil
    end
    it 'when reporting the position' do
      expect(RobotSimulator.execute('REPORT', nil)).to match /^2,2,NORTH$/
    end
  end

  describe 'rotate left' do
    it 'when placing the robot' do
      expect(RobotSimulator.execute("PLACE", "2,2,NORTH")).to equal nil
    end
    it 'when rotating the robot' do
      expect(RobotSimulator.execute("LEFT", nil)).to equal nil
    end
    it 'when reporting the position' do
      expect(RobotSimulator.execute('REPORT', nil)).to match /^2,2,WEST$/
    end
    it 'when rotating the robot' do
      expect(RobotSimulator.execute("LEFT", nil)).to equal nil
    end
    it 'when reporting the position' do
      expect(RobotSimulator.execute('REPORT', nil)).to match /^2,2,SOUTH$/
    end
    it 'when rotating the robot' do
      expect(RobotSimulator.execute("LEFT", nil)).to equal nil
    end
    it 'when reporting the position' do
      expect(RobotSimulator.execute('REPORT', nil)).to match /^2,2,EAST$/
    end
    it 'when rotating the robot' do
      expect(RobotSimulator.execute("LEFT", nil)).to equal nil
    end
    it 'when reporting the position' do
      expect(RobotSimulator.execute('REPORT', nil)).to match /^2,2,NORTH$/
    end
  end

  describe 'move the robot' do
    it 'when placing the robot' do
      expect(RobotSimulator.execute("PLACE", "2,2,NORTH")).to equal nil
    end
    it 'when moving the robot forward' do
      expect(RobotSimulator.execute("MOVE", nil)).to equal nil
    end
    it 'when reporting the position' do
      expect(RobotSimulator.execute('REPORT', nil)).to match /^2,3,NORTH$/
    end
    it 'when moving the robot forward' do
      expect(RobotSimulator.execute("MOVE", nil)).to equal nil
    end
    it 'when reporting the position' do
      expect(RobotSimulator.execute('REPORT', nil)).to match /^2,4,NORTH$/
    end
    it 'when moving the robot forward from edge' do
      expect(RobotSimulator.execute("MOVE", nil)).to equal nil
    end
    it 'when reporting the position from edge' do
      expect(RobotSimulator.execute('REPORT', nil)).to match /^2,4,NORTH$/
    end

    it 'when placing the robot' do
      expect(RobotSimulator.execute("PLACE", "2,2,EAST")).to equal nil
    end
    it 'when moving the robot forward' do
      expect(RobotSimulator.execute("MOVE", nil)).to equal nil
    end
    it 'when reporting the position' do
      expect(RobotSimulator.execute('REPORT', nil)).to match /^3,2,EAST$/
    end
    it 'when moving the robot forward' do
      expect(RobotSimulator.execute("MOVE", nil)).to equal nil
    end
    it 'when reporting the position' do
      expect(RobotSimulator.execute('REPORT', nil)).to match /^4,2,EAST$/
    end
    it 'when moving the robot forward from edge' do
      expect(RobotSimulator.execute("MOVE", nil)).to equal nil
    end
    it 'when reporting the position from edge' do
      expect(RobotSimulator.execute('REPORT', nil)).to match /^4,2,EAST$/
    end

    it 'when placing the robot' do
      expect(RobotSimulator.execute("PLACE", "2,2,SOUTH")).to equal nil
    end
    it 'when moving the robot forward' do
      expect(RobotSimulator.execute("MOVE", nil)).to equal nil
    end
    it 'when reporting the position' do
      expect(RobotSimulator.execute('REPORT', nil)).to match /^2,1,SOUTH$/
    end
    it 'when moving the robot forward' do
      expect(RobotSimulator.execute("MOVE", nil)).to equal nil
    end
    it 'when reporting the position' do
      expect(RobotSimulator.execute('REPORT', nil)).to match /^2,0,SOUTH$/
    end
    it 'when moving the robot forward from edge' do
      expect(RobotSimulator.execute("MOVE", nil)).to equal nil
    end
    it 'when reporting the position from edge' do
      expect(RobotSimulator.execute('REPORT', nil)).to match /^2,0,SOUTH$/
    end

    it 'when placing the robot' do
      expect(RobotSimulator.execute("PLACE", "2,2,WEST")).to equal nil
    end
    it 'when moving the robot forward' do
      expect(RobotSimulator.execute("MOVE", nil)).to equal nil
    end
    it 'when reporting the position' do
      expect(RobotSimulator.execute('REPORT', nil)).to match /^1,2,WEST$/
    end
    it 'when moving the robot forward' do
      expect(RobotSimulator.execute("MOVE", nil)).to equal nil
    end
    it 'when reporting the position' do
      expect(RobotSimulator.execute('REPORT', nil)).to match /^0,2,WEST$/
    end
    it 'when moving the robot forward from edge' do
      expect(RobotSimulator.execute("MOVE", nil)).to equal nil
    end
    it 'when reporting the position from edge' do
      expect(RobotSimulator.execute('REPORT', nil)).to match /^0,2,WEST$/
    end
  end
=begin silence this for now
  describe 'execute argument count'
      ## TODO find out how to have a default value for 2nd argument so can only provide 1
    it 'when calling execute with single argument' do
      expect(RobotSimulator.execute('BLAH')).to equal(nil)
    end
=end
end
