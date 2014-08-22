require 'Table'
class Robot
  # using this for interest. dislike inability to typecheck?
  attr_accessor :table
  attr_reader   :heading
  
  @@headings = [:north, :east, :south, :west]

  def initialize()
    @heading  = nil
    @table    = nil
  end

  def heading=(heading)
    @heading = heading if @@headings.include?(heading)
  end

  def rotate_right()
    @heading = @@headings[ (@@headings.index(@heading)+ 2) % 4 - 1 ] if @heading
  end

  def rotate_left()
    @heading = @@headings[ (@@headings.index(@heading) - 1) ] if @heading
  end
end
