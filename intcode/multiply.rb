class Multiply < Instruction
  LENGTH = 4

  def execute(memory, ipointer)
    a, b, c = params
    new_memory = memory.dup
    c.write(new_memory, a.read(new_memory) * b.read(new_memory))
    [new_memory, ipointer + LENGTH]
  end
end

Instruction.register(2, Multiply)
