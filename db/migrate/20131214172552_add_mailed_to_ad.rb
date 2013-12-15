class AddMailedToAd < ActiveRecord::Migration
  def change
    add_column :ads, :mailed, :boolean
  end
end
