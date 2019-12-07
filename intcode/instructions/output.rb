class Output < Instruction
  LENGTH = 2

  def execute(computer)
    a, _ = params
    a.read(computer.memory).tap { |r| computer.log.puts r }
    computer.ipointer += LENGTH
  end
end

Instruction.register(4, Output)
