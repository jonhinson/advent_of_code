puts (File.open("input.txt").read.split("\n\n").map do |group|
  answers = {}
  group_answers = group.split("\n")
  group_answers.each do |member|
    member.split('').each do |answer|
      answers[answer] ||= 0
      answers[answer] += 1
    end
  end
  answers.select { |k, v| v == group_answers.size }.size
end.sum)