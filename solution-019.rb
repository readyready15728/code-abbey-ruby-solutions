#!/usr/bin/env ruby

gets

def valid?(line)
  stack = []

  line.each_char do |c|
    case c
    when /\(|\[|\{|\</
      stack.push c
    when ')'
      return false if stack.empty? or stack[-1] != '('
      stack.pop
    when ']'
      return false if stack.empty? or stack[-1] != '['
      stack.pop
    when '}'
      return false if stack.empty? or stack[-1] != '{'
      stack.pop
    when '>'
      return false if stack.empty? or stack[-1] != '<'
      stack.pop
    end
  end

  stack.empty?
end

puts (readlines.map do |line|
  valid?(line) ? 1 : 0
end).join ' '
