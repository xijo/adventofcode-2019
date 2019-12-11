require_relative 'instruction'

class Computer
  attr_reader :memory, :name
  attr_accessor :input, :log, :ipointer, :relative_base, :on_output

  def initialize(program, name: 'Intcode Computer', log: STDOUT, input: [], on_output: :continue)
    @ipointer      = 0
    @memory        = program.split(?,).map(&:to_i)
    @log           = log
    @input         = Array(input)
    @name          = name
    @relative_base = 0
    @on_output     = on_output
    @status        = :continue
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

  def read_and_flush
    result = read_log
    @log = StringIO.new
    result.strip
  end

  def set_input(value)
    @input = Array(value)
    self
  end

  def instruction
    Instruction.build(memory[ipointer, Instruction::MAX_LENGTH]).set_log(@log).set_input(@input)
  end

  def terminated?
    @status == :terminate
  end

  def paused?
    @status == :pause
  end

  def running?
    @status == :continue
  end

  def run
    @status = :continue

    while running?
      if delay = ENV['INTCODE_DELAY']
        Printer.new.run(self, instruction)
        sleep delay.to_i * 0.01
      end
      @status = instruction.execute(self)
    end
    self
  end
end
