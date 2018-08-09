class User < ActiveRecord::Base
  validates :password, confirmation: true
  has_secure_password

end
