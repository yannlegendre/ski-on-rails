# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.destroy_all

p 'Data destroyed'

#create user seeds
20.times do
  name = Faker::Superhero.name
  email = Faker::Internet.email
  password = 'password'
  User.create(name: name, email: email, password: password)
end

#special user toto, toto@gmail.com with pasword 'password'
User.create(name: 'toto', email: 'toto@gmail.com', password: 'azerty')

p 'Users created with toto, toto@gmail.com password : azerty'

PhotoUploader::IMG_IDS.each do |img_id|
  photo = Cloudinary::CarrierWave::StoredFile.new("image/upload/v1566297127/#{img_id}.jpg")
  price = rand(200..600)
  owner = User.take
  model = ['Rossignol', 'Salomon', 'Head'].sample
  size = rand(50..250)
  city = ['Lyon', 'Milano', 'Paris', 'Bruxelles'].sample
  Ski.create!(photo: photo, price: price, model: model, size: size, owner: owner, city: city)
end

p 'Skis created'

Transaction.create!(ski: Ski.take, customer: User.take, rental_date: 3.days.from_now)
Transaction.create!(ski: Ski.take, customer: User.take, rental_date: 4.days.from_now)
Transaction.create!(ski: Ski.take, customer: User.take, rental_date: 6.days.from_now)

p 'Transactions created'
