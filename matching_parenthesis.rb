require 'pry'

string = "Sometimes (when I nest them (my parentheticals) too much (like this (and this))) they get confusing."

def find_closing_parend(string, opening_parend)
  opening_hash = {}
  closing_array = []
  open_parens = 0

  string.each_char.with_index do |char, int|
    if char == '('
      open_parens += 1
      opening_hash[int] = open_parens
    elsif char == ')'
      closing_array << int
    end
  end
  if index = opening_hash[opening_parend]
    closing_array[-index]
  else
    raise "There is not an opening parenthesis at index #{opening_parend}"
  end
end

print find_closing_parend(string, 10)

