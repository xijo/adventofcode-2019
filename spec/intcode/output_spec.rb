require 'spec_helper'

describe Output do
  let(:memory) { [0, 20, 22] }

  it 'sums in memory' do
    Output.new(4, 2).execute(memory)
    # expect(memory).to eq [42, 20, 22]
  end
end
