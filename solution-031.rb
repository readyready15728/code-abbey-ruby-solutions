#!/usr/bin/env ruby

gets

puts (readlines.map do |line|
  k, s = line.split(' ')
  k, s = k.to_i, s.each_char.to_a

  if k.positive?
    k.times do
      c = s.shift
      s.push c
    end
  else
    k = -k

    k.times do
      c = s.pop
      s.unshift c
    end
  end

  s.join
end).join ' '
