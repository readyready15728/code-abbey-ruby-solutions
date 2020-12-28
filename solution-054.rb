#!/usr/bin/env ruby

gets
numbers = readlines.map &:to_i
upper_limit = numbers.max
triplets = []

c = 0
m = 2

while c < upper_limit
  (1..m).each do |n|
    a = m**2 - n**2
    b = 2 * m * n
    c = m**2 + n**2

    break if c > upper_limit
    break if a.zero? or b.zero? or c.zero?

    triplets.push [a, b, c]
  end

  m += 1
end

result = []

numbers.each do |n|
  triplets.each do |triplet|
    result.push triplet[2]**2 if triplet.sum == n
  end
end

puts result.join ' '
