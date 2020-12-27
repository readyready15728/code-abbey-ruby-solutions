#!/usr/bin/env ruby

k = gets.split(' ').map(&:to_i)[1]
ciphers = readlines.map(&:strip)

def decrypt(cipher, k)
  alphabet = ('A'..'Z')
  rotated_alphabet = ('A'..'Z').to_a

  k.times do
    c = rotated_alphabet.shift
    rotated_alphabet.push c
  end

  codebook = Hash[rotated_alphabet.zip(alphabet)]
  
  (cipher.each_char.map do |c|
    case c
    when /\s|\./
      c
    else
      codebook[c]
    end
  end).join
end

puts ciphers.map { |cipher| decrypt(cipher, k) }.join ' '
