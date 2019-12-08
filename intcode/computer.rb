require_relative 'instruction'

class Computer
  attr_reader :memory, :name
  attr_accessor :input, :log, :ipointer

  def initialize(program, name: 'Intcode Computer', log: STDOUT, input: [])
    @ipointer = 0
    @memory   = program.split(?,).map(&:to_i)
    @log      = log
    @input    = Array(input)
    @name     = name
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

    # catch :terminate do
    #   catch :paused do
    while running?
      # if @debug
      #   puts @memory.inspect
      #   puts instruction.inspect
      # end
      Printer.new.run(self, instruction)
      # print_line
      # sleep 0.5
      @status = instruction.execute(self)
    end

    #   @status = :terminated
    # end


    #   @status = :paused
    # end
    self
  end
end
