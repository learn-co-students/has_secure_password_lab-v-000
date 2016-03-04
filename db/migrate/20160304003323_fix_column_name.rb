class FixColumnName < ActiveRecord::Migration
  def change
	rename_column :users, :password_confirmation, :password_digest
  end
end
