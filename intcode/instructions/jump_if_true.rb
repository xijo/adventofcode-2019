class JumpIfTrue < Instruction
  LENGTH = 3

  def execute(computer)
    a, b = params
    if a.read(computer).zero?
      computer.ipointer += LENGTH
    else
      computer.ipointer = b.read(computer)
    end
    :continue
  end
end

Instruction.register(5, JumpIfTrue)
