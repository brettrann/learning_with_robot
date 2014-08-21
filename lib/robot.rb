class Robot
  
  def initialize()
    @headings = [:north, :east, :south, :west]
    @heading = nil
  end

  def heading(heading)
    heading = @headings.index(heading)
    @heading = @headings[heading] unless heading == nil
  end

  def rotate_right()
    @heading = @headings[ (@headings.index(@heading)+ 2) % 4 - 1 ] if @heading
  end

  def rotate_left()
    @heading = @headings[ (@headings.index(@heading) - 1) ] if @heading
  end
end
