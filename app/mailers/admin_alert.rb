class AdminAlert < ApplicationMailer
  default from: 'coin_alert@faker.com'

  def coin_required(coin)
    @coin = coin
    @coins.each do {|admin|
      admin.email, admin.name}
    @sum = Coin.sum_value
    mail(to:"#{admin}", subject: "More #{coin.name} coins are required.")
  end
end
