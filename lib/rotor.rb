class Rotor
  attr_accessor :rotor_values, :position, :notch # rotor values are accessible for testing purposes only

  def initialize(values, start_position, notch)
    left_row = ('A'..'Z').to_a * 2 # create an array with the alphabet twice, just like that
    # create a twodimentional array where the first dimension is
    # the alphabet and the second dimention is the provided string with values
    @rotor_values = left_row.zip(values.split('') * 2)
    @position = start_position
    @start_position = start_position
    @notch = notch
  end

  def shift_up!
    @position += 1
  end

  def reset!
    @position = @start_position
  end

  def right
    right = @rotor_values.map { |rotor_value| r[1] }
    right.slice(@position, 26)
  end

  def left
    left = @rotor_values.map { |rotor_value| r[0] }
    left.slice(@position, 26)
  end

  def convert(index, direction)
    raise "unvalid direction, valid directions are :left and :right" unless direction == :left or :right
    if direction == :left
      left.index(right[index])
    elsif direction == :right
      right.index(left[index])
    end
  end

  def shift?
    left[0] == @notch
  end
end
