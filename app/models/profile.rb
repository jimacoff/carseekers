# == Schema Information
#
# Table name: profiles
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#  bio        :text
#

class Profile < ActiveRecord::Base

  #Associations
  belongs_to :user
end
