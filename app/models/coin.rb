class Coin < ApplicationRecord
  belongs_to :user
  # belongs_to :transaction

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
