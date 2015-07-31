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
