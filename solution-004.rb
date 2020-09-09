#!/usr/bin/env ruby

gets

puts (readlines.map do |line|
  line.split.map { |x| x.to_i }.min
end).join ' '
