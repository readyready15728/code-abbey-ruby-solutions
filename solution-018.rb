#!/usr/bin/env ruby

gets

puts (readlines.map do |line|
  x, n = line.split(' ').map &:to_i
  x = x.to_f
  r = 1

  n.times do
    r = (r + x / r) / 2
  end

  r
end).join ' '
