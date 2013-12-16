class RemoveCityFromAd < ActiveRecord::Migration
  def change
    remove_column :ads, :city, :string
  end
end
