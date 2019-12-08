require 'term/ansicolor'

class String
  include Term::ANSIColor
end

input = File.read('day08/input').strip

layer_width = 25
layer_height = 6

layers = input.chars.each_slice(layer_width * layer_height).to_a.map do |layer|
  layer.each_slice(layer_width).to_a
end

layer_height.times do |i|
  layer_width.times do |j|
    layers.each do |layer|
      val = layer[i][j]
      case layer[i][j]
      when ?2 then next
      when ?1 then print '  '.on_white
      when ?0 then print '  '.on_black
      end
      break
    end
  end
  puts "\n"
end
