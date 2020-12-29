#!/usr/bin/env ruby

gets
numbers = gets.split(' ').map &:to_i

def rank(n)
  case n % 13
  when 0..8
    n % 13 + 2
  when 9
    'Jack'
  when 10
    'Queen'
  when 11
    'King'
  else
    'Ace'
  end
end

def suit(n)
  case n / 13
  when 0
    'Clubs'
  when 1
    'Spades'
  when 2
    'Diamonds'
  else
    'Hearts'
  end
end

puts numbers.map { |n| "#{rank n}-of-#{suit n}" }.join ' '
