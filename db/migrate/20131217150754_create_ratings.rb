class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.text :comment
      t.integer :rate
      t.integer :rateable_id
      t.string :rateable_type

      t.timestamps
    end
  end
end
