class JumpIfTrue < Instruction
  LENGTH = 3

  def execute(computer)
    a, b = params
    if a.read(computer.memory).zero?
      computer.ipointer += LENGTH
    else
      computer.ipointer = b.read(computer.memory)
    end
    :continue
  end
end

Instruction.register(5, JumpIfTrue)
