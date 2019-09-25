class CreateUsers < ActiveRecord::Migration[5.0]
  #created with rails g migration create_users --no-test-framework
  #https://learn.co/tracks/full-stack-web-development-v7/sinatra/activerecord/securing-passwords-in-sinatra
  def up
    create_table :users do |t|
      t.string :name
      t.string :password_digest
    end
  end
 
  def down
    drop_table :users
  end
end
