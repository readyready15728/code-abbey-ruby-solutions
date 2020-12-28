#!/usr/bin/env ruby

words = gets.split(' ')[0...-1].sort
counter = Hash.new 0

words.each do |word|
  counter[word] += 1
end

puts (words.uniq.select do |word|
  counter[word] > 1
end).join ' '
