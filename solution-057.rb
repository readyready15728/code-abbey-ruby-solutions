#!/usr/bin/env ruby

gets
time_series = gets.split(' ').map &:to_f
result = [time_series[0]]

(1...time_series.length - 1).each do |i|
  result.push time_series[i - 1..i + 1].sum / 3
end

result.push time_series[-1]

puts result.join ' '
