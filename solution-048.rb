#!/usr/bin/env ruby

gets
seeds = gets.split(' ').map &:to_i

def collatz_sequence(seed)
  x = seed
  a = []

  until x == 1
    x = x.even? ? x / 2 : 3 * x + 1
    a.push x
  end

  a
end

puts seeds.map { |seed| collatz_sequence(seed).length }.join ' '
