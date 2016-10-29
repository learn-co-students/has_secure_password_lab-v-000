class User < ActiveRecord::Base

 validates :password, presence: true

  has_secure_password



end
