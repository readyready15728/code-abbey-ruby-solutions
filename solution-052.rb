#!/usr/bin/env ruby

gets
sides = readlines.map { |line| line.split(' ').map &:to_i }

puts (sides.map do |a, b, c|
  if c**2 < a**2 + b**2
    'A'
  elsif c**2 == a**2 + b**2
    'R'
  else
    'O'
  end
end).join ' '
