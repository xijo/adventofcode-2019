class Parameter
  attr_accessor :value, :mode

  def initialize(value, mode)
    @value, @mode = value, mode
  end

  def inspect
    "<Parameter value=#{value} mode=#{mode}>"
  end

  def read(memory)
    if mode.zero?
      memory[value]
    else
      value
    end
  end

  def write(memory, given_value)
    if mode.zero?
      memory[value] = given_value
    else
      raise "invalid write parameter mode #{mode.inspect}"
    end
  end
end
