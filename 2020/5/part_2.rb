seats = []
File.open("input.txt").each do |line|
  line = line.strip
  row = line[0..6].split('').map { |f| f == 'F' ? '0' : '1' }.join.to_i(2)
  col = line[7..-1].split('').map { |f| f == 'L' ? '0' : '1' }.join.to_i(2)
  seats << row * 8 + col
end
puts seats.sort.each_cons(2).find { |(a, b)| (a + 1) != b }.inspect