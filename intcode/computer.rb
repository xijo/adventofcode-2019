require_relative 'instruction'

class Computer
  attr_reader :instruction_pointer, :memory

  def initialize(input)
    @instruction_pointer = 0
    @memory = input.split(?,).map(&:to_i)
  end

  def write(addr, value)
    memory[addr] = value
  end

  def read(addr)
    memory[addr]
  end

  def dump
    memory.join(?,)
  end

  def instruction(addr = instruction_pointer, size = 4)
    Instruction.build(memory[instruction_pointer, Instruction::MAX_LENGTH])
  end

  def run
    catch :terminate do
      while true
        instruction.execute(memory)
        @instruction_pointer += instruction.length
      end
    end
    self
  end
end
