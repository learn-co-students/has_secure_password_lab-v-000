class User < ActiveRecord::Base
  has_secure_password
  # validates_presence_of :name
  # validates :password, presence: true, confirmation: true
  # validates_confirmation_of :password
  # validates_uniqueness_of :name

end
