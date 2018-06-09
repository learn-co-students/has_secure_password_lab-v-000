class CreateUser < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :password_digest
      t.string :password
      t.string :password_confirmation
      t.string :name
    end
  end
end
