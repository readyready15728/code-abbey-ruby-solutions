#!/usr/bin/env ruby

gets
moves_list = readlines.map { |line| line.split(' ').map &:to_i }

class Board
  def initialize
    @board = (1..3).map { [nil] * 3 }
    @side = :x
  end

  def to_s
    @board.map do |row|
      (row.map do |cell|
        case cell
        when nil
          ' '
        when :x
          'X'
        when :o
          'O'
        end
      end).join('|')
    end.join("\n-----\n")
  end

  def move_to_coordinates(move)
    case move
    when 1
      [0, 0]
    when 2
      [0, 1]
    when 3
      [0, 2]
    when 4
      [1, 0]
    when 5
      [1, 1]
    when 6
      [1, 2]
    when 7
      [2, 0]
    when 8
      [2, 1]
    when 9
      [2, 2]
    end
  end

  def move(move)
    i, j = move_to_coordinates(move)
    @board[i][j] = @side
    reverse_side
  end

  def reverse_side
    @side = @side == :x ? :o : :x
  end

  def is_won?
    # Horizontal rows
    [1, 4, 7].each do |offset|
      i_0, j_0 = move_to_coordinates(offset)
      i_1, j_1 = move_to_coordinates(offset + 1)
      i_2, j_2 = move_to_coordinates(offset + 2)

      return true if @board[i_0][j_0] != nil and [@board[i_0][j_0], @board[i_1][j_1], @board[i_2][j_2]].uniq.length == 1
    end
    
    # Vertical rows
    [1, 2, 3].each do |offset|
      i_0, j_0 = move_to_coordinates(offset)
      i_1, j_1 = move_to_coordinates(offset + 3)
      i_2, j_2 = move_to_coordinates(offset + 6)

      return true if @board[i_0][j_0] != nil and [@board[i_0][j_0], @board[i_1][j_1], @board[i_2][j_2]].uniq.length == 1
    end

    # Diagonals
    i_0, j_0 = move_to_coordinates(1)
    i_1, j_1 = move_to_coordinates(5)
    i_2, j_2 = move_to_coordinates(9)
    
    return true if @board[i_0][j_0] != nil and [@board[i_0][j_0], @board[i_1][j_1], @board[i_2][j_2]].uniq.length == 1
    
    i_0, j_0 = move_to_coordinates(3)
    i_1, j_1 = move_to_coordinates(5)
    i_2, j_2 = move_to_coordinates(7)
    
    return true if @board[i_0][j_0] != nil and [@board[i_0][j_0], @board[i_1][j_1], @board[i_2][j_2]].uniq.length == 1
    
    false
  end

  def is_drawn?
    return false if is_won?
    (@board.flatten.select { |cell| [:x, :o].include? cell }).length == 9
  end
end

puts (moves_list.map do |moves|
  board = Board.new
  move_count = 0

  until board.is_won? or board.is_drawn?
    move = moves.shift
    board.move(move)
    move_count += 1
  end

  move_count = 0 if board.is_drawn?

  move_count
end).join ' '
