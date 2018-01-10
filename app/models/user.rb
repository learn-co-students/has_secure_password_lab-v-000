class User < ActiveRecord::Base
  has_secure_password
  validates :password, presence: true

  validates_confirmation_of :password

end
