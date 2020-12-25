#!/usr/bin/env ruby

gets

puts (readlines.map do |line|
  a, c, m, x_0, n = line.split(' ').map &:to_i
  x = x_0

  n.times do
    x = (a * x + c) % m
  end

  x
end).join ' '
