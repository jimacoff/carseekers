class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :make
      t.string :model
      t.string :fuel_type
      t.string :age
      t.string :type
      t.string :color
      t.string :engine
      t.string :image_url
      t.string :hp

      t.timestamps
    end
  end
end
