require 'Coordinates'

describe 'Coordinates object' do

    it 'tests instantiate coordiantes' do
      coordintes = Coordinates.new 0,0
      expects([coordinates.x, coordinates.y]).to eq([0,0])
    end
    it 'tests in_bounds' do
      bound_low = Coordinates.new 0,0
      bound_low_negative = Coordinates.new -10,-10
      bound_high = Coordinates.new 10,10
      coordinates = Coordinates.new 5,5
      expect(coordinates.in_bounds(bound_low, bound_high)).to equal true
      expect(coordinates.in_bounds(bound_high, bound_low)).to equal true
      expect(coordinates.in_bounds(bound_low_negative, bound_high)).to equal true
      expect(coordinates.in_bounds(bound_high, bound_low_negative)).to equal true
    end
end
