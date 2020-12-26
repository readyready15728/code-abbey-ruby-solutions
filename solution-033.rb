#!/usr/bin/env ruby

numbers = gets.split(' ').map &:to_i
numbers = numbers.map { |n| n.to_s 2 }
numbers = numbers.select { |s| s.count('1').even? }
numbers = numbers.map { |s| s.rjust(8, '0') }
numbers = numbers.map { |s| s.sub(/^1/, '0') }
numbers = numbers.map { |s| s.to_i 2 }
puts numbers.map(&:chr).join
