class Coin < ApplicationRecord
  has_one :transactions
  has_one :users

  def sum_value
    @coins = Coin.all
    sum = 0

    @coins.each do |coin|
      sum = @coins.value * @coin.amount
      sum += sum
    end
    sum
  end

end
