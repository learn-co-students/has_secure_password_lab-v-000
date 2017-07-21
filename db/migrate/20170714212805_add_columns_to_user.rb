class AddColumnsToUser < ActiveRecord::Migration
  def change
    add_column :users, :user, :string
    add_column :users, :password, :string
  end
end
