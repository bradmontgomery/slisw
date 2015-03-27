#!/usr/local/env ruby

# Say hello!
puts 'Hello World'

# pick a random number and let the user guess it.
puts "I've got a random number, 1-10 (inclusive), care to guess?"
prng = Random.new
num = prng.rand(1..10)
guess = gets
while guess.to_i != num
  guess.to_i < num ? puts("Too low!") : puts("Too high!")
  guess = gets

end
puts 'Nice Job!'
