# byr (Birth Year) - four digits; at least 1920 and at most 2002.
# iyr (Issue Year) - four digits; at least 2010 and at most 2020.
# eyr (Expiration Year) - four digits; at least 2020 and at most 2030.
# hgt (Height) - a number followed by either cm or in:
# If cm, the number must be at least 150 and at most 193.
# If in, the number must be at least 59 and at most 76.
# hcl (Hair Color) - a # followed by exactly six characters 0-9 or a-f.
# ecl (Eye Color) - exactly one of: amb blu brn gry grn hzl oth.
# pid (Passport ID) - a nine-digit number, including leading zeroes.
# cid (Country ID) - ignored, missing or not.

passports = File.read('input.txt')
valid = 0
rules = {
  'byr' => ->(s) { (s =~ /^\d{4}$/) && (1920..2002).include?(s.to_i) },
  'iyr' => ->(s) { (s =~ /^\d{4}$/) && (2010..2020).include?(s.to_i) },
  'eyr' => ->(s) { (s =~ /^\d{4}$/) && (2020..2030).include?(s.to_i) },
  'hgt' => ->(s) { (s =~ /^\d{3}cm$/ && (150..193).include?(s.to_i)) || (s =~ /^\d{2}in$/ && (59..76).include?(s.to_i)) },
  'hcl' => ->(s) { s =~ /^#[0-9a-f]{6}$/ },
  'ecl' => ->(s) { s =~ /^amb|blu|brn|gry|grn|hzl|oth$/ },
  'pid' => ->(s) { s =~ /^\d{9}$/ },
  'cid' => ->(s) { true }
}
passports.split("\n\n").each do |passport|
  items = Hash[*passport.split(/\s/).map { |s| s.split(':') }.flatten]
  valid += 1 if (items.keys - ['cid']).size == 7 && items.all? { |k, v| rules[k].call(v) }
end
puts valid