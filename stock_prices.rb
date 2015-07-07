# I have an array stock_prices_yesterday where:

# The indices are the time in minutes past trade opening time, which was 9:30am local time.
# The values are the price in dollars of Apple stock at that time.
# For example, the stock cost $500 at 10:30am, so stock_prices_yesterday[60] = 500.

# Write an efficient algorithm for computing the best profit I could have made from 1 purchase and 1 sale of 1 Apple stock yesterday.

# No "shorting"—you must buy before you sell. You may not buy and sell in the same time step (at least 1 minute must pass).

# walk through stock prices array
#  if current price greater than last price
#   current_profit = current_price - current_base
# else
#   current_base = current_price
# end

# best_profit = max(current_profit, best_profit)

def greatest_profit(stock_prices_array)

  current_base = stock_prices_array[0]
  best_profit = 0
  current_profit = 0

  stock_prices_array.each_with_index do |current_price, i|
    current_profit = current_price - current_base
    best_profit    = [current_profit, best_profit].max
    last_price     = [current_price, current_base].max
  end
  best_profit
end


prices = [3,56,3,7,34,54,75,68,34,58,34,73,3,63,63,12,32,23,23,23,21,42,23,913,84,36]

puts greatest_profit(prices)
