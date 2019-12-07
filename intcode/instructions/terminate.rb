class Terminate < Instruction
  LENGTH = 1

  def execute(computer)
    # throw :terminate
    :terminate
  end
end

Instruction.register(99, Terminate)
