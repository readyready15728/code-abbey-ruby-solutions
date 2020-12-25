#!/usr/bin/env ruby

gets

puts (readlines.map do |line|
  x, y, n = line.split(' ').map &:to_i

  [([x, y].max.to_f / (x + y) * n).ceil * [x, y].min,
   ([x, y].min.to_f / (x + y) * n).ceil * [x, y].max].min
end).join ' '
