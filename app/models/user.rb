class User < ActiveRecord::Base
  has_secure_password
  # random text to re-try pull request
end
