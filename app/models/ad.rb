# == Schema Information
#
# Table name: ads
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  title       :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  description :text
#

class Ad < ActiveRecord::Base

  #Associations
  belongs_to :user
  has_many :images
  accepts_nested_attributes_for :images, :allow_destroy => true
end
