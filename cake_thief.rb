require 'pry'

Cake = Struct.new(:weight, :value, :total_value)

cakes = [[7,160],[3,90],[2,15]].map { |c| Cake.new(c[0],c[1]) }
duffle_capacity = 20

def max_duffle_bag_value(cakes, duffle_capacity)

  total_value = 0
  remaining_capacity = duffle_capacity

  while remaining_capacity > 0 do

    cakes.map do |cake|
      cake.total_value = 0
      remaining_capacity.downto(1).each do |int|
        if (int / cake.weight) > 0
          cake.total_value = ((remaining_capacity / cake.weight) * cake.value)
          break
        end
      end
      cake
    end

    current_cake = cakes.max_by {|c| c.total_value}
    remaining_capacity -= (remaining_capacity / current_cake.weight) * current_cake.weight
    cakes = cakes - [current_cake]
    total_value += current_cake.total_value
  end

  total_value
end


puts max_duffle_bag_value(cakes, duffle_capacity)
