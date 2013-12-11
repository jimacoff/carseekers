class AddStyleToCar < ActiveRecord::Migration
  def change
    add_column :cars, :style, :string
  end
end
