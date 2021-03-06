require 'machinist/active_record'

User.blueprint do
  email { Faker::Internet.email }
  nick { Faker::Internet.user_name }
  password { "password" }
end

Message.blueprint do
  subject { Faker::Lorem.words(rand(2..4)).join(' ') }
  content { Faker::Lorem.sentences(rand(3..5)).join(' ') }
end

Ad.blueprint do
  title { Faker::Lorem.words(rand(2..4)).join(' ') }
  description { Faker::Lorem.sentences(rand(3..5)).join(' ') }
  starting_price { 2000.00 }
  buy_now_price { 10000.00 }
  ends { Time.now + 7.days }
  mailed { false }
  car
  user
end

Ad.blueprint(:complete) do
  car { Car.make!(:complete) }
  user { User.make! }
end

Ad.blueprint(:expired) do
  ends { Time.now - 3.days }
end

Car.blueprint do
  fuel_type { "Petrol" }
  age { "2004" }
  style { "Cabriolet" }
  engine { "2500cc - 3500cc" }
  hp { "200hp - 300hp" }
  color { "Red" }
end

Car.blueprint(:v2) do
  fuel_type { "Diesel" }
  age { "1960" }
  style { "State" }
  engine { "< 1000cc" }
  hp { "< 30hp" }
  color { "blue" }
end

Car.blueprint(:complete) do
  make
  model
end

Make.blueprint do
  name { "Audi" }
end

Model.blueprint do
  name { "TT" }
end

Car.blueprint(:v2) do
  fuel_type { "Diesel" }
  age { "1960" }
  style { "Small cars" }
  engine { "< 1000cc" }
  hp { "< 30hp" }
  color { "Blue" }
end

Image.blueprint do

end

Image.blueprint(:with_file) do
  carphoto { File.open('spec/fixtures/car.jpg') }
end

Bid.blueprint do
  highest { 3500.00 }
  user_id { 1 }
end

Rating.blueprint do
  rate { 3 }
  comment { Faker::Lorem.words(rand(2..4)).join(' ') }
end