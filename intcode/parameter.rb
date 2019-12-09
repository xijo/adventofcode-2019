class Parameter
  attr_accessor :value, :mode

  def initialize(value, mode)
    @value, @mode = value, mode
  end

  def inspect
    "<Parameter value=#{value} mode=#{mode}>"
  end

  def read(computer)
    case mode
    when 0 then computer.memory[value].to_i
    when 1 then value
    when 2 then (computer.memory[value + computer.relative_base]).to_i
    end
  end

  def write(computer, given_value)
    case mode
    when 0 then computer.memory[value] = given_value
    when 1 then raise ArgumentError, "invalid write parameter mode #{mode.inspect}"
    when 2 then computer.memory[value + computer.relative_base] = given_value
    end
  end
end
