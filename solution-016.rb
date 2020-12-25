#!/usr/bin/env ruby

gets

puts (readlines.map do |line|
  numbers = line.split(' ').map &:to_i
  numbers.pop
  (numbers.sum.to_f / numbers.length).round.to_i
end).join ' '
