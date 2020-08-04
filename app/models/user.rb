class User < ActiveRecord::Base
  validates :name, :uniqueness => true
  validates :name, :presence => true
  validates :password, :presence => true

  has_secure_password
end
