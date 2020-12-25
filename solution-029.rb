#!/usr/bin/env ruby

gets
numbers = gets.split(' ').map &:to_i
sorted_numbers = numbers.sort

puts sorted_numbers.map { |n| numbers.index(n) + 1 }.join ' '
