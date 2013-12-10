class RemoveModelFromCar < ActiveRecord::Migration
  def change
    remove_column :cars, :model, :string
  end
end
