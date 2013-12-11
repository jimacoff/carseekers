class Bid < ActiveRecord::Base

  #Associations
  belongs_to :ad
  belongs_to :user
end
