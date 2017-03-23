class ChangeUserUsernameToName < ActiveRecord::Migration
  def change
  	rename_column :users, :username, :name
  	rename_column :users, :password, :password_digest
  end
end
