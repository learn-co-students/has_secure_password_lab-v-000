class User < ActiveRecord::Base
  has_secure_password
  validates_confirmation_of :password_confirmation, :password
end
