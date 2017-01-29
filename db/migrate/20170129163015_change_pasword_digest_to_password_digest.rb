class ChangePaswordDigestToPasswordDigest < ActiveRecord::Migration
  def change
    remove_column(:users, :pasword_digest)
  end

  def change
    add_column(:users, :password_digest, :string)
  end
end
