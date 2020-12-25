#!/usr/bin/env ruby

current_value = gets.to_i

readlines.each do |line|
  operator, argument = line.split(' ')
  argument = argument.to_i

  case operator
  when '+'
    current_value += argument
  when '*'
    current_value *= argument
  when '%'
    current_value %= argument
  end
end

puts current_value
