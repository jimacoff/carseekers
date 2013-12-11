require 'machinist/active_record'

User.blueprint do
  email { Faker::Internet.email }
  nick { Faker::Internet.user_name }
  password { "password" }
end

Ad.blueprint do
  title { Faker::Lorem.words(rand(2..4)).join(' ') }
  description { Faker::Lorem.sentences(rand(3..5)).join(' ') }
end

Make.blueprint do
  name { "Audi" }
end

Model.blueprint do
  name { "TT" }
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