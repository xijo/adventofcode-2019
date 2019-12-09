require_relative '../intcode'

program = File.read('day09/input').strip

computer = Computer.new(program, input: [2])

computer.run
