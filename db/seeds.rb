MARQUES = ['Rossignol', 'Salomon', 'Head', 'Fisher', 'Dynastar', 'Atomic']
MODELES = ['XP PRO', 'PRO GT', 'Jojo Limited Edition', 'Signature Kevcha', 'Freestyle Limited edition', 'BTX', 'All Star', '', 'Killer', 'Pro Star']
ETATS = ['état quasi neuf', 'recommandé par Jojo', 'très bon état', 'parfait pour débutants', 'très peu utilisé', 'pour skieurs confirmés', 'tous pourris', 'neufs', '']

User.destroy_all

p 'Data destroyed'

#create user seeds
20.times do
  name = Faker::Name.name
  email = Faker::Internet.email
  password = 'password'
  User.create(name: name, email: email, password: password)
end

#special user jojo, toto@gmail.com with pasword 'password'
jojo = User.create(name: 'Tonton Joseph', email: 'toto@gmail.com', password: 'azerty')

p 'Users created with Jojo, toto@gmail.com password : azerty'

PhotoUploader::IMG_IDS.each do |img_id|
  photo = Cloudinary::CarrierWave::StoredFile.new("image/upload/v1566297127/#{img_id}.jpg")
  price = rand(8..25)
  owner = User.all.sample
  model = "#{MARQUES.sample} #{MODELES.sample} #{rand(2000..2021)}, #{ETATS.sample}"
  size = rand(155..190)
  city = ['Lyon', 'Milano', 'Venissieux', 'Courchevel', 'Tignes', 'Val d\'Isere'].sample
  Ski.create!(photo: photo, price: price, model: model, size: size, owner: owner, city: city)
end
ski_de_jojo = Ski.create!(photo: Cloudinary::CarrierWave::StoredFile.new("image/upload/v1566297127/oqfq05zqijac0gidglyc.jpg"),
              price: 25, model: 'Le bon ski custom du jojo, état de ouf',
              size: 150, owner: jojo, city: 'Lyon')

p 'Skis created'

Transaction.create!(ski: Ski.all.sample, customer: User.all.sample, rental_date: 3.days.from_now)
Transaction.create!(ski: Ski.all.sample, customer: User.all.sample, rental_date: 4.days.from_now)
Transaction.create!(ski: Ski.all.sample, customer: User.all.sample, rental_date: 5.days.from_now)


#jojo a loué des  skis à qqun
Transaction.create!(ski: Ski.all.sample, customer: jojo, rental_date: 30.days.ago)
Transaction.create!(ski: Ski.all.sample, customer: jojo, rental_date: 20.days.ago)
Transaction.create!(ski: Ski.all.sample, customer: jojo, rental_date: 20.days.ago)


#on a loué les skis de jojo
Transaction.create!(ski: ski_de_jojo, customer: User.all.sample, rental_date: 40.days.ago)
Transaction.create!(ski: ski_de_jojo, customer: User.all.sample, rental_date: 45.days.ago)
Transaction.create!(ski: ski_de_jojo, customer: User.all.sample, rental_date: 46.days.ago)
Transaction.create!(ski: ski_de_jojo, customer: User.all.sample, rental_date: 47.days.ago)



p 'Transactions created'
