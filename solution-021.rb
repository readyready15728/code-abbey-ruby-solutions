#!/usr/bin/env ruby

N = gets.split(' ')[1].to_i
numbers = gets.split(' ').map &:to_i
counter = Hash.new 0

numbers.each do |n|
  counter[n] += 1
end

puts (1..N).map { |n| counter[n] }.join ' '
