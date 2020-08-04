class User < ActiveRecord::Base
  has_secure_password

  validates :name, :uniqueness => true
  validates :name, :presence => true
  validates :password_confirmation, :presence => true
end
