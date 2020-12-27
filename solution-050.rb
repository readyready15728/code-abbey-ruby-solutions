#!/usr/bin/env ruby

gets
strings = readlines
strings = strings.map { |string| string.downcase.scan(/[a-z]/).join }
puts strings.map { |string| string == string.reverse ? 'Y' : 'N' }.join ' '
