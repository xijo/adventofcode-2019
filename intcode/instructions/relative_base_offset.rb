class RelativeBaseOffset < Instruction
  LENGTH = 2

  def execute(computer)
    a, _ = params
    computer.relative_base += a.read(computer)
    computer.ipointer += LENGTH
    :continue
  end
end

Instruction.register(9, RelativeBaseOffset)
