require_relative 'reflector'
require_relative 'rotor'

class EnigmaMachine
  LAMPBOARD = ('A'..'Z').to_a

  def initialize
    @left_rotor = Rotor.new("EKMFLGDQVZNTOWYHXUSPAIBRCJ", 12, 'Q')
    @middle_rotor = Rotor.new("AJDKSIRUXBLHWTMCQGZNPYFVOE", 2, 'E')
    @right_rotor = Rotor.new("BDFHJLCPRTXVZNYEIWGAKMUSQO", 10, 'V')
    @rotors = [@right_rotor, @middle_rotor, @left_rotor]
  end

  def convert_character(character)
    index = LAMPBOARD.index(character.upcase)
    @right_rotor.shift_up! # right rotor gets shifted up before each letter is encoded/decoded
    @rotors.each { |rotor| index = rotor.convert(index, :left ) } # pass the character through the rotors from right to left
    index = Reflector.reflect(index)  # reflect
    @rotors.reverse.each { |rotor| index = rotor.convert(index, :right )} # pass the character from left to right
    shift_rotors!
    LAMPBOARD[index]
  end

  def convert_word(input)
    input.split('').map { |char| convert_character(char) }.join
  end

  def convert_sentence(input)
    input.split.map { |word| convert_word(word) }.join(' ')
  end

  def reset!
    @rotors.each { |rotor| rotor.reset! }
  end

private
  def shift_rotors!
    if @right_rotor.shift?
      @middle_rotor.shift_up!
    end
    if @middle_rotor.shift?
      @middle_rotor.shift_up!
      @left_rotor.shift_up!
    end
    if @left_rotor.shift?
      @left_rotor.shift_up!
    end
  end
end
