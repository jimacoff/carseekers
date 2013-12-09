class RemoveBodyFromAd < ActiveRecord::Migration
  def change
    remove_column :ads, :body, :text
  end
end
