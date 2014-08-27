require 'Point'

class Robot
  attr_accessor :point
  attr_reader :heading, :Headings

  Headings = [:north, :east, :south, :west]

  def initialize
    @heading = @point = nil
  end

  def heading=(heading)
    @heading = heading if valid_heading(heading)
  end

  def rotate_right
    @heading = Headings[ (Headings.index(@heading) + 2) % 4 - 1 ] if @heading
  end

  def rotate_left
    @heading = Headings[ Headings.index(@heading) - 1 ] if @heading
  end

  def valid_heading(heading)
   return Headings.include? heading
  end

  def desired_move
    desired_point = @point.clone
    case @heading
      when :north
        desired_point.y = desired_point.y+1
      when :south
        desired_point.y = desired_point.y-1
      when :east
        desired_point.x = desired_point.x+1
      when :west
        desired_point.x = desired_point.x-1
    end
    desired_point
  end
end
