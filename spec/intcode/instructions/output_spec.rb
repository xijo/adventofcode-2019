require 'spec_helper'

describe Output do
  let(:computer) { Computer.new('0,20,22', log: StringIO.new) }

  it 'writes to the log' do
    instruction = Instruction.build([4, 2])
    expect(instruction).to be_a(Output)
    expect { instruction.execute(computer) }.to change { computer.ipointer }.from(0).to(2)
    expect(computer.read_log).to eq "22\n"
  end
end
