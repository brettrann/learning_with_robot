require 'point'

describe 'Point object' do

    it 'tests instantiate point' do
      point = Point.new 0,0
      expect([point.x, point.y]).to eq([0,0])
      point = Point.new 8,-5
      expect([point.x, point.y]).to eq([8,-5])
    end
    it 'tests method inside for boundary check' do
      bound_low = Point.new 0,0
      bound_low_negative = Point.new -10,-10
      bound_high = Point.new 10,10
      point_in = Point.new 5,5
      point_out_1 = Point.new 100,100
      point_out_2 = Point.new -100,-100
      expect(point_in.inside?(bound_low, bound_high)).to equal true
      expect(point_in.inside?(bound_high, bound_low)).to equal true
      expect(point_in.inside?(bound_low_negative, bound_high)).to equal true
      expect(point_in.inside?(bound_high, bound_low_negative)).to equal true
      expect(point_out_1.inside? bound_high, bound_low).to equal false
    end
end
