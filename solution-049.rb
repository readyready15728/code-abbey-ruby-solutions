#!/usr/bin/env ruby

gets
matches = readlines.map { |line| line.split(' ') }

def rock_paper_scissors(choice_1, choice_2)
  case choice_1
  when 'R'
    case choice_2
    when 'R'
      nil
    when 'P'
      2
    when 'S'
      1
    end
  when 'P'
    case choice_2
    when 'R'
      1
    when 'P'
      nil
    when 'S'
      2
    end
  when 'S'
    case choice_2
    when 'R'
      2
    when 'P'
      1
    when 'S'
      nil
    end
  end
end

def evaluate_match(match)
  wins = Hash.new 0

  match.each do |round|
    choice_1, choice_2 = round.each_char.to_a
    outcome = rock_paper_scissors(choice_1, choice_2)
    wins[outcome] += 1 unless outcome.nil?
  end

  wins[1] > wins[2] ? 1 : 2
end

puts matches.map { |match| evaluate_match(match) }.join ' '
