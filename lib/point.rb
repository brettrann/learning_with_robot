class Point

  attr_accessor :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end

  def inside(bound_a, bound_b)
    if @x >= bound_a.x && @x <= bound_b.x
      @y >= bound_a.y && @y <= bound_b.y
    elsif @x >= bound_b.x && @x <= bound_a.x
      @y >= bound_b.y && @y <= bound_a.y
    end
  end

end
