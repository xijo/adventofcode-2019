class Add < Instruction
  LENGTH = 4

  def execute(computer)
    a, b, c = params
    c.write(computer, a.read(computer) + b.read(computer))
    computer.ipointer += LENGTH
    :continue
  end

  def change_position
    params.last.value
  end

  def read_position
    [
      params.first.value,
      params[1].value,
    ]
  end
end

Instruction.register(1, Add)
