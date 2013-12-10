class AddAdIdToCar < ActiveRecord::Migration
  def change
    add_column :cars, :ad_id, :integer
  end
end
