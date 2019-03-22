class CreateUsersTable < ActiveRecord::Migration[5.0]
  def change
    create_table :users_tables do |t|
      t.string :name
      t.string :password_digest
    end
  end
end
