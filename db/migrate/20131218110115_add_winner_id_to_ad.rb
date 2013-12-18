class AddWinnerIdToAd < ActiveRecord::Migration
  def change
    add_column :ads, :winner_id, :integer
  end
end
