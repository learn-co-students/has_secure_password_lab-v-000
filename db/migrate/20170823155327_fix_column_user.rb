class FixColumnUser < ActiveRecord::Migration
  def change
    rename_column :users, :user, :name
  end
end
