class AddEndDateActiveToAd < ActiveRecord::Migration
  def change
    add_column :ads, :ends, :date
    add_column :ads, :active, :boolean
  end
end
