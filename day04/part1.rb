candidates = (307237...769058).select do |pw|
  pw.to_s[/(\d)\1/] && pw.to_s.split('').sort.join == pw.to_s
end

puts candidates.count
