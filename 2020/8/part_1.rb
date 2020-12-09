ops = {}
accumulator = 0
index = 0
lines = File.open("input.txt").read.split("\n")
until ops[index]
  line = lines[index]
  op, value = line.scan(/(acc|jmp|nop) ([-|+]\d+)/)[0]
  if op == 'nop'
    ops[index] = [op, value]
    index += 1
  elsif op == 'acc'
    ops[index] = [op, value]
    accumulator += value.to_i
    index += 1
  elsif op == 'jmp'
    ops[index] = [op, value]
    index += value.to_i
  end
end
puts accumulator