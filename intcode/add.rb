class Add < Instruction
  LENGTH = 4

  def execute(memory)
    a, b, c = params
    memory[c] = memory[a] + memory[b]
  end
end

Instruction.register(1, Add)
