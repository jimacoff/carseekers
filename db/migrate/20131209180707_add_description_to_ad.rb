class AddDescriptionToAd < ActiveRecord::Migration
  def change
    add_column :ads, :description, :text
  end
end
