require 'pry'

str = 'taco'

def get_permutations(string)

  return [string] if string.length < 2

  all_chars_except_last = string[0...string.length - 1]
  last_char = string[-1]

  # recursive call: get all possible permutations for all chars except last
  permutations_of_all_chars_except_last = get_permutations(all_chars_except_last)

  # put the last char in all possible positions for each of the above permutations
  possible_positions_to_put_last_char = 0..all_chars_except_last.length

  permutations ||= []

  permutations_of_all_chars_except_last.each do |permutation_of_all_chars_except_last|
    possible_positions_to_put_last_char.each do |position|
      permutation = permutation_of_all_chars_except_last[0...position] + last_char + permutation_of_all_chars_except_last[position..-1]
      puts permutation
      permutations << permutation
    end
  end
  puts permutations.length
  permutations
end

get_permutations(str)
