#!/usr/bin/env ruby

gets
puts (gets.split(' ').map do |n|
  digits = n.each_char.map &:to_i
  (1..digits.length).zip(digits).map { |w, d| w * d }.sum
end).join ' '
