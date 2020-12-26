#!/usr/bin/env ruby

p, r, l = gets.split(' ').map &:to_f
r /= 100
r /= 12

puts ((p * r * (1 + r)**l) / ((1 + r)**l - 1)).round
