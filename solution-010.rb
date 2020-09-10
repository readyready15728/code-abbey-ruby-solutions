#!/usr/bin/env ruby

gets

puts (readlines.map do |line|
  x_0, y_0, x_1, y_1 = line.split.map { |n| n.to_i }
  m = (y_1 - y_0) / (x_1 - x_0)
  b = y_0 - m * x_0

  "(#{m} #{b})"
end).join ' '
