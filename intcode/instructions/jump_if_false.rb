class JumpIfFalse < Instruction
  LENGTH = 3

  def execute(computer)
    a, b = params
    if a.read(computer).zero?
      computer.ipointer = b.read(computer)
    else
      computer.ipointer += LENGTH
    end
    :continue
  end
end

Instruction.register(6, JumpIfFalse)
