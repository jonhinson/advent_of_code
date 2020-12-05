passports = File.read('input.txt')
valid = 0
passports.split("\n\n").each do |passport|
  valid += 1 if (passport.split(/\s/).map { |s| s.split(':').first } - ['cid']).size == 7
end
puts valid