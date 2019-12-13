require_relative '../intcode'
require_relative '../tools/grid'

program = File.read('day13/input').strip

computer = Computer.new(program, log: StringIO.new, on_output: :pause)

grid = Grid.new

while true
  computer.terminated? and break

  x = computer.run.read_and_flush.to_i
  y = computer.run.read_and_flush.to_i
  v = case computer.run.read_and_flush.to_i
      when 0 then nil
      when 1 then ?◼
      when 2 then ?◻
      when 3 then ?–
      when 4 then ?●
      end
  grid[x, y] = v
end

puts "\e[H\e[2J"
puts grid.inspect

puts grid.positions(?◻).size

# puts result
