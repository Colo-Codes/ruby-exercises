# https://www.theodinproject.com/lessons/ruby-sub-strings
# Implement a method #substrings that takes a word as the first argument and then an
# array of valid substrings (your dictionary) as the second argument. It should return
# a hash listing each substring (case insensitive) that was found in the original
# string and how many times it was found.

def substrings(word = '', dictionary = [])
  return 'Error: invalid arguments provided' if !word.is_a?(String) || !dictionary.is_a?(Array)
  return 'Error: no arguments provided' if word.nil? || dictionary.nil? || word.empty? || dictionary.empty?

  match_hash = {}

  dictionary.each do |substring|
    if word.index(substring)
      match_hash[substring] = match_hash[substring].nil? ? 1 : match_hash[substring] + 1
    end
  end

  match_hash
end
