class Input < Instruction
  LENGTH = 2

  def execute(computer)
    a, _ = params
    a.write(computer.memory, computer.consume_input)
    computer.ipointer += LENGTH
  end
end

Instruction.register(3, Input)
