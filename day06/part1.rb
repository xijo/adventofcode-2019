lines = <<EOS.strip.lines.map(&:strip)
COM)B
B)C
C)D
D)E
E)F
B)G
G)H
D)I
E)J
J)K
K)L
EOS

lines = File.read('day06/input').strip.lines.map(&:strip)

depths = { 'COM' => 0 }

while lines.size > 0 do
  lines.each_with_index do |line, index|
    orbitee, orbiter = line.split(?))
    if depths[orbitee]
      depths[orbiter] = depths[orbitee] + 1
      lines.delete_at index
    end
  end
end

puts depths.values.sum
