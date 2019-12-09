class Equals < Instruction
  LENGTH = 4

  def execute(computer)
    a, b, c    = params
    val        = a.read(computer) == b.read(computer) ? 1 : 0
    c.write(computer, val)
    computer.ipointer += LENGTH
    :continue
  end

  def change_position
    params.last.value
  end
end

Instruction.register(8, Equals)
