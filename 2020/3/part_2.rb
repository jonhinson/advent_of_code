width = File.open("input.txt") { |f| f.readline.strip }.size
result = [
  [1, 1],
  [3, 1],
  [5, 1],
  [7, 1],
  [1, 2]
].map do |(right, down)|
  trees = 0
  File.open("input.txt").each_with_index do |line, index|
    if index > 0 && (index % down == 0)
      current_position = (index * right) % width
      trees += 1 if line.strip[current_position] == '#'
    end
  end
  trees
end.reduce(:*)
puts result