class AddDefaultLocationToUsers < ActiveRecord::Migration
  def change
    add_column :users, :default_location, :varchar
  end
end
