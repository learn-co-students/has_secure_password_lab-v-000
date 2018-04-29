class AddPasswordAndChangeNameOnUsers < ActiveRecord::Migration
  def change
  	rename_column :users, :username, :name
  	add_column :users, :password, :string
  end
end
