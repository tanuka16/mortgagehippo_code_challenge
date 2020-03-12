# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

coin1 = Coin.create(name: "Penny", value: 1, amount: 2);
coin2 = Coin.create(name: "Nickel", value: 5, amount: 2);
coin3 = Coin.create(name: "Dime", value: 10, amount: 2);
coin4 = Coin.create(name: "Quater", value: 25, amount: 2);

user1 = User.create(api_key: 1);
