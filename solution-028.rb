#!/usr/bin/env ruby

gets

puts (readlines.map do |line|
  weight, height = line.split(' ').map &:to_f
  bmi = weight / height**2

  case bmi
  when (0...18.5)
    'under'
  when (18.5...25)
    'normal'
  when (25...30)
    'over'
  else
    'obese'
  end
end).join ' '
