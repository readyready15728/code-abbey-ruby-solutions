#!/usr/bin/env ruby

gets
positions = readlines.map do |line|
  king_code, queen_code = line.split(' ')
  king_rank = king_code[1].to_i
  king_file = king_code[0].ord - 96
  queen_rank = queen_code[1].to_i
  queen_file = queen_code[0].ord - 96

  [[king_rank, king_file], [queen_rank, queen_file]]
end

puts (positions.map do |king_position, queen_position|
  king_rank, king_file = king_position
  queen_rank, queen_file = queen_position

  if king_rank == queen_rank
    'Y'
  elsif king_file == queen_file
    'Y'
  elsif (king_rank - queen_rank).abs == (king_file - queen_file).abs
    'Y'
  else
    'N'
  end
end).join ' '
