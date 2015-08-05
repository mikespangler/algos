require 'pry'
require 'benchmark'

array = [1,2,3,4,5,6,7,8,9,10,11,12]

def shuffle(array)

  new_array = []

  until array.length == 0 do
    rand = rand(0...array.length)
    new_array << array.slice!(rand) 
  end

  new_array
end

array = [1,2,3,4,5,6,7,8,9,10,11,12]


def in_place_shuffle(array)
  array.length.times do |i|
    rand = rand(array.length - i) + i
    el = array.slice!(rand)
    array << el
  end
  print array
end

array = [1,2,3,4,5,6,7,8,9,10,11,12]

def fisher_yates(array)
  n = array.length
  for i in 0...n
    r = rand(n-i)+i
    array[r], array[i] = array[i], array[r]
  end
  print array
end

puts Benchmark.measure { fisher_yates(array) }
puts Benchmark.measure { in_place_shuffle(array) }
