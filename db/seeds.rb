# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Transaction.delete_all
Ski.delete_all
User.delete_all

20.times do
  name = Faker::Superhero.name
  email = Faker::Internet.email
  password = 'password'
  User.create(name: name, email: email, password: password)
end

30.times do
  photo = 'coucou'
  price = rand(200..600)
  owner = User.all.sample
  model = ['Rossignol', 'Salomon', 'Head'].sample
  size = rand(50..250)
  city = ['Lyon', 'Milano', 'Paris', 'Bruxelles'].sample
  Ski.create!(photo: photo, price: price, model: model, size: size, owner: owner, city: city)
end

