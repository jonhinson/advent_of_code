primary = {}
File.open("input.txt").each do |rule|
  outer, inners = rule.split(" bags contain ")
  primary[outer] = inners.scan(/(\d+) (.+?) bag/).map { |(count, k)| [k, count.to_i] }
end; 0
inners = primary['shiny gold']
counts = inners.each_with_object({}) { |(k, count), h| h[k] = count }
while inners.any?
  color, count = inners.shift
  primary[color].each do |new_color, new_count|
    counts[new_color] ||= 0
    inners << [new_color, new_count * count]
    counts[new_color] += new_count * count
  end
end
puts counts.values.sum