#!/usr/bin/env ruby

gets
puts (readlines.map { |line| line.split(' ').map &:to_i }.map do |triplet|
  triplet.sort[1]
end).join ' '
