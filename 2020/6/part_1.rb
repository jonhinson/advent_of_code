puts (File.open("input.txt").read.split("\n\n").map do |group|
  group.split("\n").flat_map { |s| s.split('') }.uniq.size
end.sum)