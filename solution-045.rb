#!/usr/bin/env ruby

indices = (0..51).to_a
numbers = gets.split(' ').map &:to_i
suits = %w{C D H S}
ranks = %w{A 2 3 4 5 6 7 8 9 T J Q K}
deck = suits.product(ranks).map { |suit, rank| suit + rank }

indices.zip(numbers).each do |i, j|
  j %= 52
  deck[i], deck[j] = deck[j], deck[i] 
end

puts deck.join ' '
