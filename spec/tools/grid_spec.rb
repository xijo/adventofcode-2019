require 'spec_helper'

describe Grid do
  let(:grid) { Grid.new(?•) }

  it 'sets the correct value' do
    grid[1, 2] = ?x
    expect(grid[0, 0]).to eq ?•
    expect(grid[1, 2]).to eq ?x
    expect(grid.get(1, 2)).to eq ?x
  end

  it 'displays a correct inspect' do
    grid[2, 3] = ?x
    grid[0, 0] = ?o
    grid[1, 1] = ?i
    expect(grid.inspect).to eq <<-EOS
       3   •   •   •   •   •   •
       2   •   •   •   •   x   •
       1   •   •   i   •   •   •
       0   •   o   •   •   •   •
      -1   •   •   •   •   •   •
          -1   0   1   2   3   4
    EOS
  end

  it 'draws lines correctly' do
    grid.draw([0, 1], [0, 4]) { |v| ?x }
    expect(grid.inspect).to eq <<-EOS
       5   •   •   •
       4   •   x   •
       3   •   x   •
       2   •   x   •
       1   •   x   •
       0   •   •   •
      -1   •   •   •
          -1   0   1
    EOS
  end

  it 'draws spaces correctly' do
    grid.draw([0,1], [2,4]) { |v| ?x }
    expect(grid.inspect).to eq <<-EOS
       5   •   •   •   •   •
       4   •   x   x   x   •
       3   •   x   x   x   •
       2   •   x   x   x   •
       1   •   x   x   x   •
       0   •   •   •   •   •
      -1   •   •   •   •   •
          -1   0   1   2   3
    EOS
  end

  it '#positions returns the correct values' do
    grid.draw([0,1], [0,3]) { |v| ?x }
    expect(grid.positions(?x)).to eq [[0,1], [0,2], [0,3]]
  end
end
