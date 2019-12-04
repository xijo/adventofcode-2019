candidates = (307237...769058).select do |pw|
  pw.to_s.scan(/(\d)(\1+)/).any? { |g| g.join.size == 2 } && pw.to_s.split('').sort.join == pw.to_s
end

puts candidates.count
