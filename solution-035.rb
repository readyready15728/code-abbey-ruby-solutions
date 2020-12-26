#!/usr/bin/env ruby

gets
parameters = readlines.map { |line| line.split(' ').map &:to_f }

puts (parameters.map do |s, r, p|
  total = s
  years = 0

  while total < r
    total = total * (1 + p / 100)
    years += 1
  end

  years
end).join ' '
