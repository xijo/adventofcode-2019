class Add < Instruction
  LENGTH = 4

  def execute(memory, ip)
    a, b, c = params
    new_memory = memory.dup
    c.write(new_memory, a.read(new_memory) + b.read(new_memory))
    [new_memory, ip + LENGTH]
  end
end

Instruction.register(1, Add)
