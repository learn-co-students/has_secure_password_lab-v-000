class User < ActiveRecord::Base
  validates :name, uniqueness: true
  has_secure_password
end
