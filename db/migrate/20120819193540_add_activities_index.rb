class AddActivitiesIndex < ActiveRecord::Migration
  def change
    add_index :activities, [:request_id, :created_at]
  end
end
