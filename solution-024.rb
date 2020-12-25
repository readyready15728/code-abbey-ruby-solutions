#!/usr/bin/env ruby

require 'set'

gets
numbers = gets.split(' ').map &:to_i

class Integer 
  def iterations_to_repetition
    n = self
    already_seen = Set.new
    counter = 0

    until already_seen.include? n
      counter += 1
      already_seen.add n
      n = sprintf('%08d', n ** 2)[2..5].to_i
    end

    counter
  end
end

puts numbers.map(&:iterations_to_repetition).join ' '
