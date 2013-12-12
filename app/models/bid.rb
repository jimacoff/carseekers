# == Schema Information
#
# Table name: bids
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  ad_id      :integer
#  created_at :datetime
#  updated_at :datetime
#  highest    :float
#

class Bid < ActiveRecord::Base

  #Associations
  belongs_to :ad
  belongs_to :user
end
