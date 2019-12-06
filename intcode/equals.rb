class Equals < Instruction
  LENGTH = 4

  def execute(memory, ipointer)
    a, b, c    = params
    new_memory = memory.dup
    val        = a.read(new_memory) == b.read(new_memory) ? 1 : 0
    c.write(new_memory, val)
    [new_memory, ipointer + LENGTH]
  end
end

Instruction.register(8, Equals)
