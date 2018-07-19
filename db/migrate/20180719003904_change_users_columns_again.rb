class ChangeUsersColumnsAgain < ActiveRecord::Migration
  def change
    remove_column :users, :password_confirmation
    rename_column :users, :password, :password_digest
  end
end
