class RemovePasswordConfirmationAndPasswordFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :password_confirmation, :string
    remove_column :users, :password, :string
  end
end
