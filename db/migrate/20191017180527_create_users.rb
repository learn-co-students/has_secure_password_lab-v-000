# https://learn.co/tracks/full-stack-web-development-v8/module-13-rails/section-12-authentication/using-has_secure-password-lab
# auto generated from running migrations
class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      # new code start
      t.string :password_digest
      # new code end
      t.timestamps
    end
  end
end
