input = File.read('day08/input').strip

# puts input

layer_width = 25
layer_height = 6

min = input.chars.each_slice(layer_width * layer_height).to_a.min_by do |layer|
  layer.count ?0
end.join

puts min
puts min.count(?1) * min.count(?2)
