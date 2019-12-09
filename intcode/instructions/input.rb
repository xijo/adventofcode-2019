class Input < Instruction
  LENGTH = 2

  def execute(computer)
    a, _ = params
    a.write(computer, computer.consume_input)
    computer.ipointer += LENGTH
    :continue
  end

  def change_position
    params.first.value
  end
end

Instruction.register(3, Input)
