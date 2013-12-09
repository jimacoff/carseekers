class Image < ActiveRecord::Base

  #Associations
  belongs_to :ad

  #Uploader mounted
  mount_uploader :carphoto, CarPhotoUploader
end
