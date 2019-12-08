class Instruction
  MAX_LENGTH = 4

  attr_accessor :opcode, :params

  def self.register(opcode, klass)
    @opcodes ||= {}
    @opcodes[opcode.to_s.rjust(2, ?0)] = klass
  end

  def self.build(slice)
    instr  = slice[0].to_s.split('')
    opcode = instr.pop(2).join.rjust(2, ?0)                                     # remove opcode from instr
    klass  = @opcodes[opcode] or raise ArgumentError, "invalid opcode #{opcode.inspect}, slice: #{slice.inspect}"
    length = klass.const_get(:LENGTH) - 1                                       # - opcode
    pmodes = instr.join.rjust(length, ?0).chars.map(&:to_i).reverse             # only modes are left within instr
    params = slice[1, length].zip(pmodes).map { |(v, m)| Parameter.new(v, m) }
    klass.new(opcode, params)
  end

  def initialize(opcode, params)
    @opcode = opcode
    @params = params
  end

  def set_log(log)
    @log = log
    self
  end

  def set_input(input)
    @input = input
    self
  end

  def inspect
    "#{self.class.name.rjust(20)} #{opcode}, #{params.inspect}"
  end

  def change_position
  end

  def length
    self.class.const_get(:LENGTH)
  end
end
