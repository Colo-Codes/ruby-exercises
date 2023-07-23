# Implement a method #stock_picker that takes in an array of stock prices,
# one for each hypothetical day. It should return a pair of days representing
# the best day to buy and the best day to sell. Days start at 0.
#  > stock_picker([17,3,6,9,15,8,6,1,10])
#  => [1,4]  # for a profit of $15 - $3 == $12

# Initial analysis:
# -----------------
# 1. Get the highest price
# 2. Get the lowest price before that highest price
# 3. Move on to the next highest price
# 4. Get the lowest price before that highest price
# 5. continue until no prices are left to check
# 6. Get the highest spread among the ones calculated

def stock_picker(stock_prices)
  return 'Error: Invalid input' unless valid_input? stock_prices

  spreads = {}

  stock_prices.each_index do |i|
    next unless i.positive?

    length_to_price = i

    while length_to_price.positive?
      length_to_price -= 1
      spreads[stock_prices[i] - stock_prices[length_to_price]] =
        [length_to_price, i]
    end
  end

  spreads[spreads.keys.max]
end

def valid_input?(input)
  input.is_a?(Array) && !input.empty? && input.all?(Numeric)
end
