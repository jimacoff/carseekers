class AddCarPhotoToImage < ActiveRecord::Migration
  def change
    add_column :images, :carphoto, :string
  end
end
