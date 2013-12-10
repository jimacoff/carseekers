# == Schema Information
#
# Table name: cars
#
#  id         :integer          not null, primary key
#  make       :string(255)
#  model      :string(255)
#  fuel_type  :string(255)
#  age        :string(255)
#  type       :string(255)
#  color      :string(255)
#  engine     :string(255)
#  image_url  :string(255)
#  hp         :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Car < ActiveRecord::Base
  belongs_to :ad
end
