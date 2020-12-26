#!/usr/bin/env ruby
require 'cmath'

gets
parameters = readlines.map { |line| line.split(' ').map &:to_f }

puts (parameters.map do |a, b, c|
  x_0 = (-b + CMath.sqrt(b**2 - 4 * a * c)) / (2 * a)
  x_1 = (-b - CMath.sqrt(b**2 - 4 * a * c)) / (2 * a)

  if x_0.class == Float
    if x_0 > x_1
      "#{x_0.to_i} #{x_1.to_i}"
    else
      "#{x_1.to_i} #{x_0.to_i}"
    end
  else
    if x_0.imag > 0
      "#{x_0.real.to_i}+#{x_0.imag.to_i}i #{x_1.real.to_i}#{x_1.imag.to_i}i"
    else
      "#{x_1.real.to_i}+#{x_1.imag.to_i}i #{x_0.real.to_i}#{x_0.imag.to_i}i"
    end
  end
end).join '; '
