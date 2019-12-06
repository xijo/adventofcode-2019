class Output < Instruction
  LENGTH = 2

  def execute(memory, ipointer)
    a, _ = params
    a.read(memory).tap { |r| @log.puts r }
    [memory, ipointer + 2]
  end
end

Instruction.register(4, Output)
