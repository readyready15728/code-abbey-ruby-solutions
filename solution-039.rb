#!/usr/bin/env ruby

gets
data = readlines.map { |line| line.split(' ') }
stocks = []

data.each do |a|
  stocks.push a.shift
end

price_histories = data.map { |a| a.map &:to_i }

# Statistical functions taken from "The Ruby Way"
def mean(x)
  sum = 0.0
  x.each { |v| sum += v }
  sum / x.length
end

def variance(x)
  m = mean(x)
  sum = 0.0
  x.each { |v| sum += (v-m)**2 }
  sum / x.size
end

def sigma(x)
  Math.sqrt(variance(x))
end

puts ((stocks.zip(price_histories).select do |stock, price_history|
  sigma(price_history) > 4 * 0.01 * mean(price_history)
end).map do |stock, _|
  stock
end).join ' '
