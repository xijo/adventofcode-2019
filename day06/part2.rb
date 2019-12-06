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
K)YOU
I)SAN
EOS

lines = File.read('day06/input').strip.lines.map(&:strip)

def path_to_target(path, lines)
  target = path.last
  target == 'COM' and return path

  lines.each do |line|
    orbitee, orbiter = line.split(?))
    if orbiter == target
      path << orbitee
      break
    end
  end
  path_to_target(path, lines)
end

path1 = path_to_target(['YOU'], lines)
path2 = path_to_target(['SAN'], lines)

puts ((path1 - path2) | (path2 - path1)).size - 2
