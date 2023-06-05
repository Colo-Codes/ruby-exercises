# https://www.theodinproject.com/lessons/ruby-caesar-cipher
# Implement a caesar cipher that takes in a string and the shift factor and then outputs the modified string:
#     > caesar_cipher("What a string!", 5)
#     => "Bmfy f xywnsl!"

def caesar_cipher(text, shift_factor = 0)
  return 'Error: input is not a string' unless text.is_a? String
  return 'Error: shift factor is not a valid number' unless shift_factor.is_a? Integer

  letters = ('a'..'z').to_a

  text.chars.map.with_index do |character, index|
    encrypted_letter_index = letters.index(character.downcase) ? letters.index(character.downcase) + shift_factor : nil

    # Return original character when it is not a letter
    if encrypted_letter_index.nil?
      text[index]
    else

      # If the shifted character index is greater than the las letter of the alphabet,
      # resume count from the beginning of the alphabet
      encrypted_letter_index -= letters.length if encrypted_letter_index > letters.length

      if text[index] == text[index].upcase
        letters[encrypted_letter_index].upcase
      else
        letters[encrypted_letter_index]
      end
    end
  end.join
end