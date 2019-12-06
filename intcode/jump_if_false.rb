class JumpIfFalse < Instruction
  LENGTH = 3

  def execute(memory, ipointer)
    a, b = params
    if a.read(memory).zero?
      [memory, b.read(memory)]
    else
      [memory, ipointer + LENGTH]
    end
  end
end

Instruction.register(6, JumpIfFalse)
