#!/usr/bin/env ruby

gets
data = readlines.map { |line| line.split(' ').map &:to_i }
guesses = data.map { |a| a[0].to_s.rjust(4, '0').each_char.map &:to_i }
answers = data.map { |a| a[1] }
matches_to_get_right = answers.length
current_matches = 0
i = 0

while i < 10000
  secret_number = sprintf('%04d', i).each_char.map &:to_i

  guesses.zip(answers).each do |guess, answer|
    matched_digits = (secret_number.zip(guess).select { |d_0, d_1| d_0 == d_1 }).length
    current_matches += 1 if matched_digits == answer
  end

  break if current_matches == matches_to_get_right

  i += 1
  current_matches = 0
end

puts i
