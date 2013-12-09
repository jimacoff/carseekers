class Ad < ActiveRecord::Base

  #Associations
  belongs_to :user
  has_many :images
end
