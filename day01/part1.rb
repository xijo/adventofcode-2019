lines = File.readlines('day01/input')

puts lines.map { |l| (l.to_i / 3.0).floor - 2 }.sum
