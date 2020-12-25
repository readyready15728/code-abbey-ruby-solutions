#!/usr/bin/env ruby

gets
numbers = gets.split(' ').map &:to_i
result = 0

numbers.each do |n|
  result += n
  result *= 113
  result %= 10000007
end

puts result
