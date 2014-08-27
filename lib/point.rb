class Point

  attr_accessor :x, :y

  def initialize(x, y)
    @x, @y = x, y
  end

  def inside?(bound_a, bound_b)

    if @x    >= bound_a.x && @x <= bound_b.x
      @y     >= bound_a.y && @y <= bound_b.y

    elsif @x >= bound_b.x && @x <= bound_a.x
      @y     >= bound_b.y && @y <= bound_a.y

    else
      false
    end
  end
end
