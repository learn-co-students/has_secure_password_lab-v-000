class ChangeUsersUsernames < ActiveRecord::Migration
  change_table :users do |t|
    t.rename :name, :username
  end
end
