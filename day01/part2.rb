lines = File.readlines('day01/input')

def fuel_with_interest(mass, fuel = 0)
  ontop = (mass.to_i / 3.0).floor - 2
  return fuel if ontop <= 0
  fuel_with_interest(ontop, fuel + ontop)
end

puts lines.map { |l| fuel_with_interest(l) }.sum
