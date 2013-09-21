require 'minitest/spec'
require 'minitest/autorun'
require_relative '../lib/rotor'

describe Rotor do
	it "can accept a string and create a valid rotor" do
		correct_rotor = [["A", "E"],["B", "K"],["C", "M"],["D", "F"],["E", "L"],["F", "G"],["G", "D"],["H", "Q"],["I", "V"],["J", "Z"],["K", "N"],["L", "T"],["M", "O"],["N", "W"],["O", "Y"],["P", "H"],["Q", "X"],["R", "U"],["S", "S"],["T", "P"],["U", "A"],["V", "I"],["W", "B"],["X", "R"],["Y", "C"],["Z", "J"],["A", "E"],["B", "K"],["C", "M"],["D", "F"],["E", "L"],["F", "G"],["G", "D"],["H", "Q"],["I", "V"],["J", "Z"],["K", "N"],["L", "T"],["M", "O"],["N", "W"],["O", "Y"],["P", "H"],["Q", "X"],["R", "U"],["S", "S"],["T", "P"],["U", "A"],["V", "I"],["W", "B"],["X", "R"],["Y", "C"],["Z", "J"]]
		rotor = Rotor.new("EKMFLGDQVZNTOWYHXUSPAIBRCJ", 10, 'Q')
		rotor.rotor_values.must_equal correct_rotor
	end

	it "must accept a start position" do
		rotor = Rotor.new("EKMFLGDQVZNTOWYHXUSPAIBRCJ", 10, 'Q')
		rotor.position.must_equal 10
	end

	it "must accept a notch " do
		rotor = Rotor.new("EKMFLGDQVZNTOWYHXUSPAIBRCJ", 10, 'Q')
		rotor.notch.must_equal 'Q'
	end

	it "must shift up by one row" do
		rotor = Rotor.new("EKMFLGDQVZNTOWYHXUSPAIBRCJ", 10, 'Q')
		rotor.shift_up!.must_equal 11
		rotor.shift_up!.must_equal 12
		rotor.shift_up!.must_equal 13
	end

	it "must reset the rotor to the start position" do
		rotor = Rotor.new("EKMFLGDQVZNTOWYHXUSPAIBRCJ", 10, 'Q')
		rotor.shift_up!
		rotor.shift_up!
		rotor.reset!
		rotor.position.must_equal 10
	end

	it "must return an array with the right side of the rotor_values starting at the position and be no longer than 26 characters" do
		rotor = Rotor.new("EKMFLGDQVZNTOWYHXUSPAIBRCJ", 10, 'Q')
		rotor.right.must_equal ["N", "T", "O", "W", "Y", "H", "X", "U", "S", "P", "A", "I", "B", "R", "C", "J", "E", "K", "M", "F", "L", "G", "D", "Q", "V", "Z"]
	end

	it "must return an array with the left side of the rotor_values starting at the position and be no longer than 26 characters" do
		rotor = Rotor.new("EKMFLGDQVZNTOWYHXUSPAIBRCJ", 10, 'Q')
		rotor.left.must_equal ["K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J"] 
	end

	it "must convert a character correctly" do
		rotor = Rotor.new("EKMFLGDQVZNTOWYHXUSPAIBRCJ", 10, 'Q')
		rotor.convert(0, :left).must_equal 3
		rotor.convert(3, :right).must_equal 0
	end

	it "must return if the notch appears in the window" do
		rotor = Rotor.new("EKMFLGDQVZNTOWYHXUSPAIBRCJ", 16, 'Q')
		rotor.shift?.must_equal true
		rotor = Rotor.new("EKMFLGDQVZNTOWYHXUSPAIBRCJ", 10, 'Q')
		rotor.shift?.must_equal false
	end
end