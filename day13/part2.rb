require_relative '../intcode'
require_relative '../tools/grid'

program = File.read('day13/input').strip

computer = Computer.new(program, log: StringIO.new, on_output: :pause)
computer.write(0, 2)

grid = Grid.new
score = 0

while true
  puts "\e[H\e[2J"
  puts grid.inspect
  puts score
  sleep 0.001

  computer.terminated? and break

  x = computer.run.read_and_flush.to_i
  y = computer.run.read_and_flush.to_i

  if x == -1 && y == 0
    score = computer.run.read_and_flush.to_i
    next
  end

  v = case computer.run.read_and_flush.to_i
      when 0 then nil
      when 1 then ?◼
      when 2 then ?◻
      when 3 then ?–
      when 4 then ?●
      end
  grid[x, y] = v

  ball_position = grid.positions(?●).first or next
  paddle_position = grid.positions(?–).first or next

  if ball_position.first > paddle_position.first
    computer.set_input(1)
  elsif ball_position.first < paddle_position.first
    computer.set_input(-1)
  else
    computer.set_input(0)
  end
end

puts "\e[H\e[2J"
puts grid.inspect
puts score
