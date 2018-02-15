class User < ActiveRecord::Base
  has_secure_password
  validates_presence_of :password
  validates_confirmation_of :password
end
