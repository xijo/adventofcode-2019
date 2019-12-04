require 'spec_helper'

describe Path do
  it 'builds the correct points' do
    path = Path.new('R5,U4,L3,D2')
    expect(path.points).to eq([[0, 0], [1, 0], [2, 0], [3, 0], [4, 0], [5, 0], [5, 1], [5, 2], [5, 3], [5, 4], [4, 4], [3, 4], [2, 4], [2, 3], [2, 2]])
  end

  it 'ends at the correct position' do
    path = Path.new('R5,U4,L3,D2')
    expect(path.start).to eq [0, 0]
    expect(path.position).to eq [2, 2]
  end

  it 'respects the start position' do
    path = Path.new('R5,U4,L3,D2', start: [1, 0])
    expect(path.start).to eq [1, 0]
    expect(path.position).to eq [3, 2]
  end

  it 'can be drawn on a grid' do
    grid = Grid.new(?•)
    path = Path.new('R5,U4,L3,D2')
    grid.draw_path(path) { |v| ?x }
    expect(grid.inspect).to eq <<-EOS
       5   •   •   •   •   •   •   •   •
       4   •   •   •   x   x   x   x   •
       3   •   •   •   x   •   •   x   •
       2   •   •   •   x   •   •   x   •
       1   •   •   •   •   •   •   x   •
       0   •   x   x   x   x   x   x   •
      -1   •   •   •   •   •   •   •   •
          -1   0   1   2   3   4   5   6
    EOS
  end
end
