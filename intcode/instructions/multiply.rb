class Multiply < Instruction
  LENGTH = 4

  def execute(computer)
    a, b, c = params
    c.write(computer.memory, a.read(computer.memory) * b.read(computer.memory))
    computer.ipointer += LENGTH
  end
end

Instruction.register(2, Multiply)