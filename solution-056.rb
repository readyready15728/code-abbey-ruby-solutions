#!/usr/bin/env ruby

initial_state = readlines.map &:strip

class GameOfLife
  def initialize(initial_state)
    initial_width = initial_state[0].length
    initial_height = initial_state.length

    @state = []

    # Provide ample space for the simulation to unfold
    (7 * initial_height).times do
      @state.push [:dead] * (7 * initial_height)
    end

    initial_state.each_with_index do |row, i|
      row.each_char.each_with_index do |cell, j|
        @state[3 * initial_height + i][2 * initial_width + j] = :alive if cell == 'X'
      end
    end
  end

  def live_neighbors(i, j)
    cells_to_consider = []
    
    cells_to_consider.push [i - 1, j] unless i == 0 # N
    cells_to_consider.push [i - 1, j + 1] unless i == 0 or j == @state[0].length - 1 # NE
    cells_to_consider.push [i, j + 1] unless j == @state[0].length - 1 # E
    cells_to_consider.push [i + 1, j + 1] unless i == @state.length - 1 or j == @state[0].length - 1 # SE
    cells_to_consider.push [i + 1, j] unless i == @state.length - 1 # S
    cells_to_consider.push [i + 1, j - 1] unless i == @state.length - 1 or j == 0 # SW
    cells_to_consider.push [i, j - 1] unless j == 0 # W
    cells_to_consider.push [i - 1, j - 1] unless i == 0 or j == 0 # NW

    (cells_to_consider.select do |i, j|
      @state[i][j] == :alive
    end).length
  end

  def update
    new_state = Marshal.load(Marshal.dump(@state))
    
    (0...new_state.length).each do |i|
      (0...new_state[0].length).each do |j|
        l = live_neighbors(i, j)

        if @state[i][j] == :alive
          if l < 2 or l > 3
            new_state[i][j] = :dead
          end
        end

        if @state[i][j] == :dead
          new_state[i][j] = :alive if l == 3
        end
      end
    end

    @state = new_state
  end

  def count_living
    (@state.map do |row|
      row.count :alive
    end).sum
  end

  def to_s
    (@state.map do |row|
      (row.map do |cell|
        case cell
        when :dead
          '-'
        else
          'X'
        end
      end).join
    end).join "\n"
  end
end

game_of_life = GameOfLife.new(initial_state)
result = []

5.times do
  game_of_life.update
  result.push game_of_life.count_living
end

puts result.join ' '
