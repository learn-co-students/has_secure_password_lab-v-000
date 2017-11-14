class User < ActiveRecord::Base
  validates :name, uniqueness: true
  validates :password_digest, presence: true
  has_secure_password
end
