require 'spec_helper'
require 'table'
require 'point'

describe "Table object" do

  it 'when initializing table with default bounds' do
    expect(table = Table.new).to be_a Table
    expect(table.bottom_left_point).to be_a Point
    expect([table.bottom_left_point.x, table.bottom_left_point.y]).to eq [0,0]
    expect([table.top_right_point.x, table.top_right_point.y]).to eq [4,4]
    expect(table.contains? Point.new(0,0)).to be_truthy
    expect(table.contains? Point.new(4,4)).to be_truthy
    expect(table.contains? Point.new(1,3)).to be_truthy
    expect(table.contains? Point.new(5,5)).to be_falsey
    expect(table.contains? Point.new(-1,5)).to be_falsey
    expect(table.contains? Point.new(-1,-1)).to be_falsey
  end

  it 'when initializing table with explicit bounds' do
    expect(table = Table.new(100,100)).to be_a Table
    expect(table.bottom_left_point).to be_a Point
    expect([table.bottom_left_point.x, table.bottom_left_point.y]).to eq [0,0]
    expect([table.top_right_point.x, table.top_right_point.y]).to eq [99,99]
    expect(table.contains? Point.new(0,0)).to be_truthy
    expect(table.contains? Point.new(99,99)).to be_truthy
    expect(table.contains? Point.new(1,98)).to be_truthy
    expect(table.contains? Point.new(100,100)).to be_falsey
    expect(table.contains? Point.new(-1,-1)).to be_falsey
    expect(table.contains? Point.new(-1,100)).to be_falsey
  end
end
