#!/usr/bin/env ruby

gets

puts (readlines.map do |line|
  a, b = line.split.map { |x| x.to_f }
  (a / b).round
end).join ' '
