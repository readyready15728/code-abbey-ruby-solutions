#!/usr/bin/env ruby

numbers = gets.split(' ').map &:to_i
puts "#{numbers.max} #{numbers.min}"
