require 'pry'

ints = [1,2,3,4,5,6,7,8,9,10,11,12,12,13,14,15,16]

# O(n) time and O(n) space.

def find_double(array)
  temp_array = []

  array.each do |int|
    if temp_array[int]
      return int
    else
      temp_array[int] = true
    end
  end

  "No number appeared twice!"
end

puts find_double(ints)

# O(n) time and O(1) additional space.

def triangle_find_double(array)
  n = array.length - 1
  triangular_array_sum = ((n**2)+n)/2
  array.inject(:+) - triangular_array_sum
end

puts triangle_find_double(ints)
