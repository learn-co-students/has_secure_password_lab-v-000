class AddPasswordDigestToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.remove :password
      t.remove :password_confirmation
      t.string :password_digest
    end
  end
end
