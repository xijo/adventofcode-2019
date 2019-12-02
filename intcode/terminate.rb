class Terminate < Instruction
  LENGTH = 1

  def execute(memory)
    throw :terminate
  end
end

Instruction.register(99, Terminate)
