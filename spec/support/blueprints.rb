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
  fuel_type { "petrol" }
  age { "2004" }
  style { "cabriolet" }
  engine { "2500cc - 3500cc" }
  hp { "200hp - 250hp" }
  color { "red" }
end

Image.blueprint do

end

Image.blueprint(:with_file) do
  carphoto { File.open('spec/fixtures/car.jpg') }
end