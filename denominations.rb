require 'pry'

amount = 4
denominations = [1,2,3]

def change_possibilities(amount, denominations)
  ways_of_doing_n_cents = []

  denominations.each do |coin|
    (coin..(amount + 1)).each do |higher_amount|
      higher_amount_remainder = higher_amount - coin
      binding.pry
      ways_of_doing_n_cents[higher_amount] += ways_of_doing_n_cents[higher_amount_remainder]
    end
  end
end

print change_possibilities(amount, denominations)
