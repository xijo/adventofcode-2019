require 'spec_helper'

describe Input do
  let(:memory) { [0, 20, 22] }

  it 'sums in memory' do
    Input.new(3, 2).execute(memory)
    expect(memory).to eq [0, 20, 2]
  end
end
