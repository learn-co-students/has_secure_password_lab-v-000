class ChangeUsersColumns < ActiveRecord::Migration
  def change
    add_column :users, :password_confirmation, :string
    rename_column :users, :username, :name
  end
end
