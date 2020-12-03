valid = 0
File.open("input.txt").each do |line|
  policy, password = line.split(':').map(&:strip)
  indices, char = policy.split(' ')
  a, b = indices.split('-').map { |v| v.to_i - 1 }
  valid += 1 if (password[a] == char) ^ (password[b] == char)
  puts [password, char, a, b, password[a], password[b]].inspect
end
puts valid