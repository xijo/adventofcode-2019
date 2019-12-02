require 'spec_helper'

describe Add do
  let(:memory) { [0, 20, 22] }

  it 'sums in memory' do
    Add.new(1, 1, 2, 0).execute(memory)
    expect(memory).to eq [42, 20, 22]
  end
end
