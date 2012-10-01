class AddOverdueFlagToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :overdue, :boolean
  end
end
