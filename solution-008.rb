#!/usr/bin/env ruby

gets

puts (readlines.map do |line|
  start, step, count = line.split.map { |x| x.to_i }
  total = 0

  count.times do |i|
    total += start + i * step
  end

  total
end).join ' '
