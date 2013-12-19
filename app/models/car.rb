# == Schema Information
#
# Table name: cars
#
#  id         :integer          not null, primary key
#  fuel_type  :string(255)
#  age        :string(255)
#  color      :string(255)
#  engine     :string(255)
#  image_url  :string(255)
#  hp         :string(255)
#  created_at :datetime
#  updated_at :datetime
#  ad_id      :integer
#  make_id    :integer
#  model_id   :integer
#  style      :string(255)
#

class Car < ActiveRecord::Base

  #Associations
  belongs_to :ad
  belongs_to :make
  belongs_to :model
end
