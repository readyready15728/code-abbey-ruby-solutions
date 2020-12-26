#!/usr/bin/env ruby

gets
parameters = readlines.map { |line| line.split(' ').map &:to_f }

def expression(a, b, c, d, x)
  a * x + b * x**1.5 - c * Math.exp(-x / 50) - d
end

puts (parameters.map do |a, b, c, d|
  low, high = 0.to_f, 100.to_f
  epsilon = 1e-7

  while true
    mid = (low + high) / 2

    if expression(a, b, c, d, mid) < 0
      low = mid
    elsif expression(a, b, c, d, mid) > 0
      high = mid
    end

    break if -epsilon < expression(a, b, c, d, low) and expression(a, b, c, d, low) < epsilon
  end

  low
end).join ' '
