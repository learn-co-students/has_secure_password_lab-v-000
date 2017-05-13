class AddUsernameToUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string "name"
      t.string "password_digest"
      t.string "username"
    end
  end
end
