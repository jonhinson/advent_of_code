max = 0
File.open("input.txt").each do |line|
  line = line.strip
  row = line[0..6].split('').map { |f| f == 'F' ? '0' : '1' }.join.to_i(2)
  col = line[7..-1].split('').map { |f| f == 'L' ? '0' : '1' }.join.to_i(2)
  id = row * 8 + col
  max = id if id > max
end
puts max