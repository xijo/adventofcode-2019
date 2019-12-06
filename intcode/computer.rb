require_relative 'instruction'

class Computer
  attr_reader :ipointer, :memory
  attr_accessor :input, :log

  def initialize(program, log: STDOUT, input: 1)
    @ipointer = 0
    @memory   = program.split(?,).map(&:to_i)
    @log      = log
    @input    = input
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

  def read_log
    @log.tap(&:rewind).read
  end

  def set_input(value)
    @input = value
    self
  end

  def instruction
    Instruction.build(memory[ipointer, Instruction::MAX_LENGTH]).set_log(@log).set_input(@input)
  end

  def run
    catch :terminate do
      while true
        if @debug
          puts @memory.inspect
          puts instruction.inspect
        end
        @memory, @ipointer = instruction.execute(memory, ipointer)
      end
    end
    self
  end
end
