require 'pry'

string = "After beating the eggs, Dana read the next step: Add milk and eggs, then add flour and sugar.  Then, dump the flour out on the floor and order some seamless web! We came, we saw, we conquered...then we ate Bill's (Mille-Feuille) cake."

hash = Hash.new(0)

regex = /\b(\w+)\b/

string.scan(regex).each do |word|
  hash[word[0].downcase] += 1
end

puts hash
