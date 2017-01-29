class RemovePasswordDigestFromUsers < ActiveRecord::Migration
  def change
    remove_column(:users, :pasword_digest)
  end
end
