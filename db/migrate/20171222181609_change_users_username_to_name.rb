class ChangeUsersUsernameToName < ActiveRecord::Migration
  def change
    change_column :users, :username, :name
  end
end
