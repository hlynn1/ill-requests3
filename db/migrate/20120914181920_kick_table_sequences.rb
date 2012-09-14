class KickTableSequences < ActiveRecord::Migration
  def up
    connection.execute(%q{
      select setval('activities_id_seq', max(id))
      from activities
    })
    connection.execute(%q{
      select setval('customers_id_seq', max(id))
      from customers
    })
    connection.execute(%q{
      select setval('locations_id_seq', max(id))
      from locations
    })
    connection.execute(%q{
      select setval('requests_id_seq', max(id))
      from requests
    })
    connection.execute(%q{
      select setval('statuses_id_seq', max(id))
      from statuses
    })
    connection.execute(%q{
      select setval('users_id_seq', max(id))
      from users
    })
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
