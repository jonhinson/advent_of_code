valid = 0
File.open("input.txt").each do |line|
  policy, password = line.split(':').map(&:strip)
  range, char = policy.split(' ')
  range = Range.new(*range.split('-').map(&:to_i))
  valid += 1 if range.include?(password.count(char))
end
puts valid