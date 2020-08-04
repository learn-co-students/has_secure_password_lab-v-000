class User < ActiveRecord::Base
  validates :name, :uniqueness => true
  validates :name, :presence => true
  validates :password_confirmation, :presence => true

  has_secure_password
end
