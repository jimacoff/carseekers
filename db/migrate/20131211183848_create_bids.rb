class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.integer :user_id
      t.integer :ad_id
      t.float :actual_bid
      t.float :highest_bid
      t.float :buy_now_price

      t.timestamps
    end
  end
end
