class Reflector
  REFLECTOR_LIST = %w{ A B C D E F G D I J K G M K M I E B F T C V V J A T }

  def self.reflect(index)
    character = REFLECTOR_LIST[index] # get the character we need to reflect
    reflector = REFLECTOR_LIST.dup # create a duplicate of the reflector
    reflector[index] = nil # set the input character to nil so we won't return that one
    reflector.index(character)
  end
end
