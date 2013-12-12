# == Schema Information
#
# Table name: bids
#
#  id            :integer          not null, primary key
#  user_id       :integer
#  ad_id         :integer
#  buy_now_price :float
#  created_at    :datetime
#  updated_at    :datetime
#  actual        :float
#  highest       :float
#

class Bid < ActiveRecord::Base

  #Associations
  belongs_to :ad
  belongs_to :user
end
