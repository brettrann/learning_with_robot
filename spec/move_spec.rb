require 'Command'
require 'Command/turn_robot_left'
require 'Table'
require 'Robot'

describe 'Command object' do

    it 'tests move abstract class' do
      command = Command.new
      expect{command.execute('irrelevant command')}.to raise_error NotImplementedError
    end
end
