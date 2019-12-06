require 'spec_helper'

describe Instruction do
  describe '.build' do
    it 'extracts the correct opcode and pmodes' do
      instruction = Instruction.build([1102, 4, 3, 4])
      expect(instruction.opcode).to eq '02'
      p1, p2, p3 = instruction.params
      expect(p1.inspect).to eq '<Parameter value=4 mode=1>'
      expect(p2.inspect).to eq '<Parameter value=3 mode=1>'
      expect(p3.inspect).to eq '<Parameter value=4 mode=0>'
    end
  end
end
