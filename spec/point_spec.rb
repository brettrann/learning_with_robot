require 'Point'

describe 'Point object' do

    it 'tests instantiate coordiantes' do
      point = Point.new 0,0
      expect([point.x, point.y]).to eq([0,0])
      point = Point.new 8,-5
      expect([point.x, point.y]).to eq([8,-5])
    end
    it 'tests in_bounds' do
      bound_low = Point.new 0,0
      bound_low_negative = Point.new -10,-10
      bound_high = Point.new 10,10
      point = Point.new 5,5
      expect(point.inside(bound_low, bound_high)).to equal true
      expect(point.inside(bound_high, bound_low)).to equal true
      expect(point.inside(bound_low_negative, bound_high)).to equal true
      expect(point.inside(bound_high, bound_low_negative)).to equal true
    end
end
