class Robot
  attr_reader   :heading

  Headings = [:north, :east, :south, :west]

  def initialize()
    @heading  = nil
  end

  def heading=(heading)
    @heading = heading if valid_heading(heading)
  end

  def rotate_right()
    @heading = Headings[ (Headings.index(@heading)+ 2) % 4 - 1 ] if @heading
  end

  def rotate_left()
    @heading = Headings[ (Headings.index(@heading) - 1) ] if @heading
  end

  def valid_heading(heading)
   return Headings.include?(heading)
  end
end
