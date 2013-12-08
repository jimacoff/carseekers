class AddGoogleInfoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :picture_url, :string
    add_column :users, :google_token, :string
    add_column :users, :google_id, :string
  end
end
