class User < ActiveRecord::Base
  #provides user with .password and .password_confirmation methods without it having to be in the database
  has_secure_password

end
