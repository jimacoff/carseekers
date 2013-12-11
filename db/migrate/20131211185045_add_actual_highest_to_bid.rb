class AddActualHighestToBid < ActiveRecord::Migration
  def change
    add_column :bids, :actual, :float
    add_column :bids, :highest, :float
  end
end
