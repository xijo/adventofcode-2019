class Terminate < Instruction
  LENGTH = 1

  def execute(memory, ipointer)
    throw :terminate
  end
end

Instruction.register(99, Terminate)
