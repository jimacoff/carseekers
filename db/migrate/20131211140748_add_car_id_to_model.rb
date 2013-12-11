class AddCarIdToModel < ActiveRecord::Migration
  def change
    add_column :models, :car_id, :integer
  end
end
