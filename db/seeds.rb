# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'machinist'
require_relative '../spec/support/blueprints'

20.times do

  @user = User.first
  @make = Make.first
  @model = Model.first
  @ad = Ad.make!(:active => true)
  @car = Car.make!
  @car.make = @make
  @car.model = @model
  @ad.car = @car
  @user.ads << @ad

end