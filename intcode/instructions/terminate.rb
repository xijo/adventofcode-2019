class Terminate < Instruction
  LENGTH = 1

  def execute(computer)
    :terminate
  end
end

Instruction.register(99, Terminate)
