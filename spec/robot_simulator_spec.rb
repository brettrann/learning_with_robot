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

  # XXX unsure of best practise for tests, whether 'complex' loops like this
  # are worth while, or explicit tests for readability are better.
  # explicit is 4 sets of place/report it/end blocks and 8 sets move/report it/end blocks.
  # so 36 lines of code.
  describe 'try to move past edge' do
    input = ['NORTH', 'EAST', 'SOUTH', 'WEST']
    input.each do |heading|
      it 'when placing the robot' do
        expect(RobotSimulator.execute("PLACE", "2,2,#{heading}")).to equal nil
      end
      output = ( heading =~ /^[N|E]/ ? [3, 4, 4] : [1, 0, 0] )
      #output = [4, 5, 5]
      output.each do |coordinate|
        it 'when moving the robot forward' do
          expect(RobotSimulator.execute("MOVE", nil)).to equal nil
        end
        it 'when reporting the position' do
          expect(RobotSimulator.execute('REPORT', nil)).to match(
            heading =~ /^[N|S]/ ?
            /^2,#{coordinate},#{heading}$/ :
            /^#{coordinate},2,#{heading}$/ )
        end
      end
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
