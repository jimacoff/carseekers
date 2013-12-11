class RemoveActualBidHighestBidFromBid < ActiveRecord::Migration
  def change
    remove_column :bids, :actual_bid, :float
    remove_column :bids, :highest_bid, :float
  end
end
