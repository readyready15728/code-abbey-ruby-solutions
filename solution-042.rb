#!/usr/bin/env ruby

gets
draws = readlines.map { |line| line.split(' ') }

puts (draws.map do |draw|
  total = 0

  draw.each do |card|
    case card
    when /\d/
      total += card.to_i
    when /K|Q|J|T/
      total += 10
    when 'A'
      if total + 11 <= 21
        total += 11
      else
        total += 1
      end
    end
  end

  total <= 21 ? total : 'Bust'
end).join ' '
