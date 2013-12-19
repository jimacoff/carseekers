# == Schema Information
#
# Table name: makes
#
#  id         :integer          not null, primary key
#  car_id     :integer
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Make < ActiveRecord::Base

  #Associations
  has_many :models
  has_many :cars

  accepts_nested_attributes_for :models, :allow_destroy => true

  #Retreives the info from Edmunds Api, necessary to run it before app use
  def self.get_data
    cars = Edmunds::Make.new.find_all
    cars.each do |carmake|
      make = Make.new
      make.name = carmake["name"]
      carmake["models"].each do |carmodel|
        make.models << Model.new({:name => carmodel["name"]})
        make.save!
      end
    end
  end
end
