ActiveRecord::Base.establish_connection(
  :adapter  => "mysql2",
  :host     => "localhost",
  :username => "root",
  :password => "",
  :database => "super_accessors")

ActiveRecord::Schema.define do
  if ActiveRecord::Base.connection.table_exists?(:users)
    ActiveRecord::Base.connection.execute("DROP TABLE users")
  end
  create_table :users do |t|
    t.column :roles, :text
    t.column :contact_info, :text
    t.datetime :confirm_datetime
    t.datetime :last_login_datetime
  end
end
