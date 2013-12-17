# == Schema Information
#
# Table name: ratings
#
#  id            :integer          not null, primary key
#  comment       :text
#  rate          :integer
#  rateable_id   :integer
#  rateable_type :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#

class Rating < ActiveRecord::Base
  belongs_to :rateable, :polymorphic => true
end
