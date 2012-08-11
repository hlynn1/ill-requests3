class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.integer :customer_id
      t.integer :oclcnum
      t.string :title
      t.string :author
      t.string :pub
      t.string :locationplaced
      t.integer :location_id
      t.date :duedate
      t.integer :bclitem
      t.date :dateplaced

      t.timestamps
    end
  end
end
