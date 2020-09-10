#!/usr/bin/env ruby

gets

puts (readlines.map do |line|
  x, y, z = line.split.map { |side| side.to_i }

  if x + y >= z and x + z >= y and y + z >= x
    1
  else
    0
  end
end).join ' '
