# https://www.theodinproject.com/lessons/ruby-sub-strings
# Implement a method #substrings that takes a word as the first argument and then an
# array of valid substrings (your dictionary) as the second argument. It should return
# a hash listing each substring (case insensitive) that was found in the original
# string and how many times it was found.

def substrings(word = '', dictionary = [])
  return 'Error: invalid arguments provided' if !word.is_a?(String) || !dictionary.is_a?(Array)
  return 'Error: no arguments provided' if word.nil? || dictionary.nil? || word.empty? || dictionary.empty?

  word_array = word.downcase.split

  dictionary.each_with_object(Hash.new(0)) do |substring, hash|
    downcased_substring = substring.downcase

    count = word_array.count { |word_element| word_element.include?(downcased_substring) }

    hash[downcased_substring] = count if count.positive?
  end
end
