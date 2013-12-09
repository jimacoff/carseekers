require 'machinist/active_record'

User.blueprint do
  email { Faker::Internet.email }
  nick { Faker::Internet.user_name }
  password { "password" }
end

Ad.blueprint do
  title { Faker::Lorem.words(rand(2..4)).join(' ') }
end