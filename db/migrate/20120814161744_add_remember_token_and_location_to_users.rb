class AddRememberTokenAndLocationToUsers < ActiveRecord::Migration
  def change
    add_column :users, :remember_token, :string
    add_column :users, :locationcode, :string
    add_index :users, :remember_token
  end
end
