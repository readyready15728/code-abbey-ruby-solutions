#!/usr/bin/env ruby

gets

puts (readlines.map do |line|
  days_0, hours_0, minutes_0, seconds_0, days_1, hours_1, minutes_1, seconds_1 = line.split(' ').map &:to_i
  total_seconds_0 = 24 * 60 * 60 * days_0 + 60 * 60 * hours_0 + 60 * minutes_0 + seconds_0
  total_seconds_1 = 24 * 60 * 60 * days_1 + 60 * 60 * hours_1 + 60 * minutes_1 + seconds_1
  total_seconds_delta = total_seconds_1 - total_seconds_0

  days_delta = total_seconds_delta / (24 * 60 * 60)
  total_seconds_delta %= (24 * 60 * 60)
  hours_delta = total_seconds_delta / (60 * 60)
  total_seconds_delta %= (60 * 60)
  minutes_delta = total_seconds_delta / 60
  total_seconds_delta %= 60
  seconds_delta = total_seconds_delta

  "(#{days_delta} #{hours_delta} #{minutes_delta} #{seconds_delta})"
end).join ' '
