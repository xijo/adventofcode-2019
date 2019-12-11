require_relative '../intcode'
require_relative '../tools/grid'

program = File.read('day11/input').strip

computer = Computer.new(program, log: StringIO.new, on_output: :pause)

grid = Grid.new
position = [0, 0]
heading = ?^

turns = {
  ?0 => { ?< => ?v, ?^ => ?<, ?> => ?^, ?v => ?> },
  ?1 => { ?< => ?^, ?^ => ?>, ?> => ?v, ?v => ?< },
}

def move(position, heading)
  x, y = position
  case heading
  when ?< then [x - 1, y]
  when ?^ then [x, y + 1]
  when ?> then [x + 1, y]
  when ?v then [x, y - 1]
  end
end

while true
  computer.terminated? and break
  input = { ?. => 0, ?# => 1 }[grid[*position]].to_i
  computer.set_input input
  grid[*position] = { ?0 => ?., ?1 => ?# }[computer.run.read_and_flush]

  computer.terminated? and break
  heading = turns[computer.run.read_and_flush][heading]
  position = move(position, heading)
end

puts grid.positions(?.).size + grid.positions(?#).size + 1
