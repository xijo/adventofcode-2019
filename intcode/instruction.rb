class Instruction
  MAX_LENGTH = 4

  attr_accessor :opcode, :params

  def self.register(opcode, klass)
    @opcodes ||= {}
    @opcodes[opcode] = klass
  end

  def self.build(slice)
    klass = @opcodes[slice[0]]

    klass.new(*slice.first(klass.const_get(:LENGTH)))
  end

  def initialize(opcode, *params)
    @opcode = opcode
    @params = params
  end

  def length
    self.class.const_get(:LENGTH)
  end
end
