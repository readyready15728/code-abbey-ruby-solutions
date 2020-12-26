#!/usr/bin/env ruby

gets
random_values = readlines.map { |line| line.split(' ').map &:to_i }
puts (random_values.map do |die_0, die_1|
  die_0 % 6 + 1 + die_1 % 6 + 1
end).join ' '
