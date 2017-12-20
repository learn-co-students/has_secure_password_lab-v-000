class User < ActiveRecord::Base
  validates :password, presence: true
  validates :password, confirmation: true
  has_secure_password


end
