class Multiply < Instruction
  LENGTH = 4

  def execute(computer)
    a, b, c = params
    c.write(computer, a.read(computer) * b.read(computer))
    computer.ipointer += LENGTH
    :continue
  end

  def change_position
    params.last.value
  end
end

Instruction.register(2, Multiply)
