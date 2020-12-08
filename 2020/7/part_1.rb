primary = {}
File.open("input.txt").each do |rule|
  outer, inners = rule.split(" bags contain ")
  primary[outer] ||= []
  primary[outer] += inners.scan(/\d+ (.+?) bag/).flatten
end; 0
outers = primary.select { |k, v| v.include?("shiny gold") }.keys
count = outers.each_with_object({}) { |k, h| h[k] = true }
while outers.any?
  outer = outers.shift
  primary.select { |k, v| v.include?(outer) }.keys.each do |k|
    unless count[k]
      outers << k
      count[k] = true
    end
  end
end
puts count.size