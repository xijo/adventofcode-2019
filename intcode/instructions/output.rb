class Output < Instruction
  LENGTH = 2

  def execute(computer)
    a, _ = params
    a.read(computer).tap { |r| computer.log.puts r }
    computer.ipointer += LENGTH
    computer.on_output
  end
end

Instruction.register(4, Output)
