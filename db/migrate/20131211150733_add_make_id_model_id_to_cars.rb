class AddMakeIdModelIdToCars < ActiveRecord::Migration
  def change
    add_column :cars, :make_id, :integer
    add_column :cars, :model_id, :integer
  end
end
