class RemoveActualBuyNowPriceFromBid < ActiveRecord::Migration
  def change
    remove_column :bids, :actual, :float
    remove_column :bids, :buy_now_price, :float
  end
end
