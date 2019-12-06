class Input < Instruction
  LENGTH = 2

  def execute(memory, ipointer)
    a, _ = params
    new_memory = memory.dup
    a.write(new_memory, @input)
    [new_memory, ipointer + LENGTH]
  end
end

Instruction.register(3, Input)
