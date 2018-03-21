class CreateUsers < ActiveRecord::Migration

  def change
    create_table :users do |t|
      #has a name field
      t.string :name
      #has a password field
      t.string :password
      #has a password confirmation field
      t.string :password_confirmation
      t.timestamps null: false
    end
  end
end
