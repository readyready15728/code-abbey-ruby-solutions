#!/usr/bin/env ruby

m, n = gets.split(' ').map &:to_i
grid = readlines.map do |line|
  line.gsub!(' ', '')
  line.strip!

  line.each_char.map do |c|
    case c
    when /@|\$|\+/
      :empty
    else
      :obstacle
    end
  end
end

paths = (1..m).map { [0] * n }
paths[0][0] = 1

(1...m).each do |i|
  if grid[i][0] == :empty
    paths[i][0] = paths[i - 1][0]
  end
end

(1...n).each do |j|
  if grid[0][j] == :empty
    paths[0][j] = paths[0][j - 1]
  end
end

(1...m).each do |i|
  (1...n).each do |j|
    if grid[i][j] == :empty
      paths[i][j] = paths[i - 1][j] + paths[i][j - 1]
    end
  end
end

puts paths[-1][-1]
