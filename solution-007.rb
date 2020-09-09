#!/usr/bin/env ruby

values = gets.split.map { |f| f.to_f }
values.shift

puts values.map { |f| ((f - 32) * 5 / 9).round.to_i }.join ' '
