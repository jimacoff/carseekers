class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :subject
      t.text :content
      t.integer :to_id
      t.integer :from_id
      t.integer :reply_id

      t.timestamps
    end
  end
end
