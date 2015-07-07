require 'pry'

rect2 = {
  # coordinates of bottom left corner
  :x => 0,
  :y => 0,
  :length => 10,
  :height => 10
}

rect1 = {
  # coordinates of bottom left corner
  :x => 10,
  :y => 10,
  :length => 5,
  :height => 5
}

def calculate_intersection(rect1, rect2)
 rect1_x_values = (rect1[:x]..rect1[:length]).to_a
 rect1_y_values = (rect1[:y]..rect1[:height]).to_a
 rect2_x_values = (rect2[:x]..rect2[:length]).to_a
 rect2_y_values = (rect2[:y]..rect2[:height]).to_a

 rect3 = {}
 rect3[:x] = (rect1_x_values.to_a & rect2_x_values.to_a).min
 rect3[:y] = (rect1_y_values.to_a & rect2_y_values.to_a).min

 if rect3[:x] && rect3[:y]
  top = [rect2[:height] + rect2[:y], rect1[:height] + rect1[:y]].min
  right = [rect2[:length] + rect2[:x], rect1[:length] + rect1[:x]].min
  rect3[:length] = right - rect3[:x]
  rect3[:height] = top - rect3[:y]
  puts rect3
 else
  puts 'no intersection'
 end
end

calculate_intersection(rect1,rect2)
