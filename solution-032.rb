#!/usr/bin/env ruby

n, k = gets.split(' ').map &:to_i

def josephus(n, k)
  (n == 1) ? 1 : (josephus(n - 1, k) + k - 1) % n + 1
end

puts josephus(n, k)
