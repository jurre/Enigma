require 'minitest/spec'
require 'minitest/autorun'
require_relative '../lib/reflector'

describe Reflector do

  it "must convert the input character to the correct index" do
    Reflector.reflect(0).must_equal 24
    Reflector.reflect(1).must_equal 17
    Reflector.reflect(10).must_equal 13
    Reflector.reflect(18).must_equal 5
  end

end
