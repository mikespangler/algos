require 'pry'

array = []

(1..100).each do |i|
  array << i
end

(1..99).each do |i|
  array << i
end


# O(n) time & space

def find_undelivered_breakfast(delivery_ids)
  hash = {}

  delivery_ids.each_with_index do |i, index|
    hash[i] = index
  end

  hash[1]
end


# O(n) time, O(1) space

def find_undelivered_breakfast(delivery_ids)
  unique_delivery_id = 0

  delivery_ids.each_with_index do |id|
    unique_delivery_id ^= id
  end

  unique_delivery_id
end

puts find_undelivered_breakfast(array)
