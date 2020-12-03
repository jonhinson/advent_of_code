RIGHT = 3
trees = 0
width = File.open("input.txt") { |f| f.readline.strip }.size
File.open("input.txt").each_with_index do |line, index|
  if index > 0
    current_position = (index * RIGHT) % width
    trees += 1 if line.strip[current_position] == '#'
  end
end
puts trees