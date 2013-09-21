require 'minitest/spec'
require 'minitest/autorun'
require_relative '../lib/enigma_machine'

describe EnigmaMachine do
	it "must convert a character correctly" do
		em = EnigmaMachine.new
		em.convert_character('E').must_equal 'Q'
	end

	it "must convert a word correctly" do
		em = EnigmaMachine.new
		em.convert_word('QMJIDO').must_equal 'ENIGMA'
		em.reset!
		em.convert_word('ENIGMA').must_equal 'QMJIDO'
	end

	it "must convert a sentence correctly" do
		em = EnigmaMachine.new
		em.convert_sentence('QMJIDO MZWZJFJR').must_equal 'ENIGMA REVEALED'
		em.reset!
		em.convert_sentence('ENIGMA REVEALED').must_equal 'QMJIDO MZWZJFJR'
		em.reset!
		em.convert_sentence('UAZRUE KGTW').must_equal 'PRETTY COOL'
	end
end
