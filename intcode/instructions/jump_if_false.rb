class JumpIfFalse < Instruction
  LENGTH = 3

  def execute(computer)
    a, b = params
    if a.read(computer.memory).zero?
      computer.ipointer = b.read(computer.memory)
    else
      computer.ipointer += LENGTH
    end
  end
end

Instruction.register(6, JumpIfFalse)
