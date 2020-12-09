lines = File.open("input.txt").read.split("\n")
oppo_lines = {}
lines.each_with_index do |line, index|
  op, value = line.scan(/(acc|jmp|nop) ([-|+]\d+)/)[0]
  if op == 'nop' || op == 'jmp'
    oppo_lines[index] = op == 'nop' ? 'jmp' : 'nop'
  end
end
oppo_lines.each do |i, oppo_op|
  continue = true
  ops = {}
  accumulator = 0
  index = 0
  while(continue)
    break if index >= lines.size
    line = lines[index]
    op, value = line.scan(/(acc|jmp|nop) ([-|+]\d+)/)[0]
    op = oppo_op if i == index
    if ops[index]
      continue = false
    elsif op == 'nop'
      ops[index] = true
      index += 1
    elsif op == 'acc'
      ops[index] = true
      accumulator += value.to_i
      index += 1
    elsif op == 'jmp'
      ops[index] = true
      index += value.to_i
    end
  end
  puts accumulator if continue
end