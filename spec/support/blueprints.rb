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

Image.blueprint do

end

Image.blueprint(:with_file) do
  carphoto { File.open('spec/fixtures/car.jpg') }
end