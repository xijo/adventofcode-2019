require_relative '../intcode'

program = '109,1,204,-1,1001,100,1,100,1008,100,16,101,1006,101,0,99'
program = '1102,34915192,34915192,7,4,7,99,0'

program = File.read('day09/input').strip

computer = Computer.new(program, input: [1])

computer.run
