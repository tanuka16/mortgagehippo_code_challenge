class User < ApplicationRecord
  has_many :coins, through: :transactions
  has_many :transactions
end
