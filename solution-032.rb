#!/usr/bin/env ruby

n, k = gets.split(' ').map &:to_i

people = (1..n).to_a
i = 0

until people.length == 1
  if (i + 1) % k == 0
    people.shift
  else
    people.push people.shift
  end
  
  i += 1
end

pp people[0]
