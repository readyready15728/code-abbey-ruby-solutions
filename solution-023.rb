#!/usr/bin/env ruby

numbers = gets.split(' ')[0...-1].map &:to_i
swaps = 0

(0...numbers.length - 1).each do |i|
  if numbers[i] > numbers[i + 1]
    numbers[i], numbers[i + 1] = numbers[i + 1], numbers[i]
    swaps += 1
  end
end

checksum = 0

numbers.each do |n|
  checksum += n
  checksum *= 113
  checksum %= 10000007
end

puts "#{swaps} #{checksum}"
