class UpdateUsernameInUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.remove :username
      t.column :name, :string
    end
  end
end
