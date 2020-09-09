#!/usr/bin/env ruby

gets

puts (readlines.map do |line|
  pair_of_integers = line.split.map { |x| x.to_f }
  (pair_of_integers[0] / pair_of_integers[1]).round
end).join ' '
