require 'spec_helper'

describe Input do
  let(:computer) { Computer.new('1,2,3,0,0,0', input: 9) }

  it 'increments the ipointer' do
    expect {
      Instruction.build([3, 2]).execute(computer)
    }.to change { computer.ipointer }.from(0).to(2)
  end

  it 'stores input in memory in position mode' do
    instruction = Instruction.build([3, 2])
    expect(instruction).to be_a(Input)
    instruction.execute(computer)
    expect(computer.memory).to eq [1, 2, 9, 0, 0, 0]
  end

  it 'does not work with immediate mode' do
    instruction = Instruction.build([103, 2])
    expect(instruction).to be_a(Input)
    expect { instruction.execute(computer) }.to raise_error(ArgumentError)
  end
end
