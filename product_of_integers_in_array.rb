arr = [1,7,3,4,6,5,4,3,6,7,4,3,6,8,3,2,2,3,2,]

a = arr.map do |i|
  (arr - [i]).inject(:*)
end

puts a
