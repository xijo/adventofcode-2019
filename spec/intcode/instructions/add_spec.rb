require 'spec_helper'

describe Add do
  let(:computer) { Computer.new('1,2,3,0,0,0') }

  it 'sums in memory with position mode' do
    instruction = Instruction.build([1, 1, 2, 0])
    expect(instruction).to be_a(Add)
    expect {
      instruction.execute(computer)
    }.to change { computer.ipointer }.from(0).to(4)
    expect(computer.memory).to eq [5, 2, 3, 0, 0, 0]
  end

  it 'sums in memory with immediate mode' do
    instruction = Instruction.build([1101, 1, 2, 0])
    expect(instruction).to be_a(Add)
    expect {
      instruction.execute(computer)
    }.to change { computer.ipointer }.from(0).to(4)
    expect(computer.memory).to eq [3, 2, 3, 0, 0, 0]
  end
end
