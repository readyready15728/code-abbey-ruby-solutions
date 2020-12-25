#!/usr/bin/env ruby

gets

puts (readlines.map do |line|
  a, b = line.split(' ').map &:to_i
  "(#{a.gcd(b)} #{a.lcm(b)})"
end).join ' '
