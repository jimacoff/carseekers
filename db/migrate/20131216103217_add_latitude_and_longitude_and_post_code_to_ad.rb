class AddLatitudeAndLongitudeAndPostCodeToAd < ActiveRecord::Migration
  def change
    add_column :ads, :latitude, :float
    add_column :ads, :longitude, :float
    add_column :ads, :postcode, :string
  end
end
