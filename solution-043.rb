#!/usr/bin/env ruby

gets
floats = readlines.map { |line| line.to_f }
puts (floats.map { |f| (6 * f).ceil }).join ' '
