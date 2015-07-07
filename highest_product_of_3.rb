array_of_ints = [1,-10,-10,1,3,2,4,10]

def highest_product_from_three_ints(array)
  array = array.sort
  last_int = array[0]
  current_max_of_two = 0
  current_max_of_three = 0
  current_max_of_four = 0

  array.each_with_index do |int, i|
    next if i == 0

    current_product_of_two = last_int * int
    current_max_of_two = [current_max_of_two, current_product_of_two].max

    current_product_of_three = current_max_of_two * int
    current_max_of_three = [current_max_of_three, current_product_of_three].max

    last = int
  end
  puts current_max_of_three
end

highest_product_from_three_ints(array_of_ints)
