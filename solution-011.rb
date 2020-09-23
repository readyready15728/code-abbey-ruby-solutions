#!/usr/bin/env ruby

gets

puts (readlines.map do |line|
  a, b, c = line.split.map { |n| n.to_i }
  (a * b + c).to_s.split('').map { |c| c.to_i }.sum
end).join ' '
