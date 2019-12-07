require_relative 'instruction'

class Computer
  attr_reader :memory
  attr_accessor :input, :log, :ipointer

  def initialize(program, log: STDOUT, input: [])
    @ipointer = 0
    @memory   = program.split(?,).map(&:to_i)
    @log      = log
    @input    = Array(input)
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

  def consume_input
    @input.shift
  end

  def read_log
    @log.tap(&:rewind).read
  end

  def set_input(value)
    @input = Array(value)
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
        instruction.execute(self)
      end
    end
    self
  end
end
