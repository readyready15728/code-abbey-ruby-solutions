#!/usr/bin/env ruby

require 'rubygems'
require 'bundler/setup'
require 'knn'

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

numbers = [1, 2, 3, 4, 5]
sides = [2, 4, 6, 8, 10, 12]
prng = Random.new
vectors = []

numbers.each do |n|
  sides.each do |s|
    # Generate this many vectors for each (n, s)
    10.times do
      observations = []

      # This many rolls of n dice with s sides
      100.times do
        observation = 0

        n.times do
          observation += prng.rand(s) + 1
        end

        observations.push observation
      end

      vectors.push Knn::Vector.new([
        observations.min,
        observations.max,
        mean(observations),
        variance(observations)
      ], "#{n}d#{s}")
    end
  end
end

classifier = Knn::Classifier.new(vectors, 3)
observation_list = readlines.map { |line| line.split(' ').map(&:to_i)[0...-1] }

observation_list.each do |observations|
  min = observations.min
  max = observations.max
  m = mean(observations)
  v = variance(observations)

  puts classifier.classify([min, max, m, v])
end
