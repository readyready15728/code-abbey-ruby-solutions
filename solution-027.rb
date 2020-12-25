#!/usr/bin/env ruby

gets
numbers = gets.split(' ').map &:to_i
passes = 0
total_swaps = 0
current_swaps = nil

until current_swaps == 0
  current_swaps = 0

  (0...numbers.length - 1).each do |i|
    if numbers[i] > numbers[i + 1]
      numbers[i], numbers[i + 1] = numbers[i + 1], numbers[i]
      current_swaps += 1
    end
  end

  passes += 1
  total_swaps += current_swaps
end

puts "#{passes} #{total_swaps}"
