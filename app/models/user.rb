class User < ActiveRecord::Base
  validates :password, presence: true
  validates :name, uniqueness: true
  has_secure_password


end
