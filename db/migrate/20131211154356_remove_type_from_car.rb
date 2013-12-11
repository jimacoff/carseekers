class RemoveTypeFromCar < ActiveRecord::Migration
  def change
    remove_column :cars, :type, :string
  end
end
