class KickTableSequences < ActiveRecord::Migration
  def up
    execute 'ALTER SEQUENCE activities_id_seq RESTART WITH 159;'
    execute 'ALTER SEQUENCE requests_id_seq RESTART WITH 80;'
    execute 'ALTER SEQUENCE customers_id_seq RESTART WITH 93;'
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
