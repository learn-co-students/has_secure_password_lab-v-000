class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :users, :passwork_digest, :password_digest
  end
end
