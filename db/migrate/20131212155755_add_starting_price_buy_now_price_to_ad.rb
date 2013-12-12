class AddStartingPriceBuyNowPriceToAd < ActiveRecord::Migration
  def change
    add_column :ads, :starting_price, :float
    add_column :ads, :buy_now_price, :float
  end
end
