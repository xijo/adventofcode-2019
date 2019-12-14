input = File.read('day12/input').strip

# input = <<EOS
# <x=-1, y=0, z=2>
# <x=2, y=-10, z=-7>
# <x=4, y=-8, z=8>
# <x=3, y=5, z=-1>
# EOS

class Moon
  attr_accessor :px, :py, :pz, :vx, :vy, :vz, :name

  def initialize(line, name:)
    @px, @py, @pz = line.scan(/\-?\d+/).map(&:to_i)
    @vx, @vy, @vz = 0, 0, 0
    @name = name
  end

  def inspect
    "#{name.ljust(10)} pos=<x=#{@px.to_s.rjust(3)}, y=#{@py.to_s.rjust(3)}, z=#{@pz.to_s.rjust(3)}>, vel=<x=#{@vx.to_s.rjust(3)}, y=#{@vy.to_s.rjust(3)}, z=#{@vz.to_s.rjust(3)}>"
  end

  def apply_gravity(other_moon)
    @vx += gravity_correction_for(other_moon, :px)
    @vy += gravity_correction_for(other_moon, :py)
    @vz += gravity_correction_for(other_moon, :pz)
  end

  def apply_velocity
    @px += @vx
    @py += @vy
    @pz += @vz
  end

  def total_energy
    potential_energy = @px.abs + @py.abs + @pz.abs
    kinetic_energy = @vx.abs + @vy.abs + @vz.abs
    potential_energy * kinetic_energy
  end

  def ==(other_moon)
    name == other_moon.name
  end

  private

  def gravity_correction_for(other_moon, dim)
    value = send(dim)
    other_value = other_moon.send(dim)
    if value > other_value
      -1
    elsif value < other_value
      1
    else
      0
    end
  end
end

io       = Moon.new(input.lines[0], name: 'Io')
europa   = Moon.new(input.lines[1], name: 'Europa')
ganymede = Moon.new(input.lines[2], name: 'Ganymede')
callisto = Moon.new(input.lines[3], name: 'Callisto')

moons = [io, europa, ganymede, callisto]
initial_moons = moons.map(&:dup)

i = 1

smallest_x = nil
smallest_y = nil
smallest_z = nil

while true
  moons.each do |moon|
    moons.each do |other_moon|
      next if moon == other_moon
      moon.apply_gravity(other_moon)
    end
  end

  moons.each(&:apply_velocity)

  i += 1

  puts <<-EOS
  \e[2J\e[f
  smallest x: #{smallest_x.inspect}
  smallest y: #{smallest_y.inspect}
  smallest z: #{smallest_z.inspect}
  step: #{(i).to_s.rjust(20)}
  EOS


  if !smallest_x
    if initial_moons.map(&:px) == moons.map(&:px)
      smallest_x = i
    end
  end

  if !smallest_y
    if initial_moons.map(&:py) == moons.map(&:py)
      smallest_y = i
    end
  end

  if !smallest_z
    if initial_moons.map(&:pz) == moons.map(&:pz)
      smallest_z = i
    end
  end

  break if smallest_x && smallest_y && smallest_z
end

puts smallest_x
puts smallest_y
puts smallest_z
puts [smallest_x, smallest_y, smallest_z].reduce(1, :lcm)
