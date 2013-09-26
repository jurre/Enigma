require_relative 'lib/enigma_machine'

# print usage and terminate if no input is given
abort "Usage: ruby enigma.rb <sentence to encrypt/decrypt>" if ARGV.size == 0

input = ARGV.join(' ')

em = EnigmaMachine.new
puts em.convert_sentence(input)