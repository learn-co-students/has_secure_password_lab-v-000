class User < ActiveRecord::Base
  # has_secure_password adds two fields to your model: password and password_confirmation
  # the method expects there to be a password_digest column defined in your migrations
  has_secure_password
end

