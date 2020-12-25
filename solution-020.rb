#!/usr/bin/env ruby

gets

puts (readlines.map do |line|
  line.scan(/[aeiouy]/).length
end).join ' '
