# == Schema Information
#
# Table name: cars
#
#  id         :integer          not null, primary key
#  fuel_type  :string(255)
#  age        :string(255)
#  type       :string(255)
#  color      :string(255)
#  engine     :string(255)
#  image_url  :string(255)
#  hp         :string(255)
#  created_at :datetime
#  updated_at :datetime
#  ad_id      :integer
#

class Car < ActiveRecord::Base
  belongs_to :ad
  has_one :make

  accepts_nested_attributes_for :make, :allow_destroy => true

end
