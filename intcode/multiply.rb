class Multiply < Instruction
  LENGTH = 4

  def execute(memory)
    a, b, c = params
    memory[c] = memory[a] * memory[b]
  end
end

Instruction.register(2, Multiply)
