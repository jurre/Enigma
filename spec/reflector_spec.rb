require 'minitest/spec'
require 'minitest/autorun'
require_relative '../lib/reflector'

describe Reflector do

	it "must convert the input character to the correct index" do
		reflector = Reflector.new
		reflector.reflect(0).must_equal 24
		reflector.reflect(0).must_equal 24
		reflector.reflect(0).must_equal 24
		reflector.reflect(0).must_equal 24
	end
	
end