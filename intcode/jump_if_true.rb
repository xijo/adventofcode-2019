class JumpIfTrue < Instruction
  LENGTH = 3

  def execute(memory, ipointer)
    a, b = params
    if a.read(memory).zero?
      [memory, ipointer + LENGTH]
    else
      [memory, b.read(memory)]
    end
  end
end

Instruction.register(5, JumpIfTrue)
