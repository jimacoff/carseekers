# == Schema Information
#
# Table name: images
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#  ad_id      :integer
#  carphoto   :string(255)
#

class Image < ActiveRecord::Base

  #Associations
  belongs_to :ad

  #Uploader mounted
  mount_uploader :carphoto, CarPhotoUploader
end
