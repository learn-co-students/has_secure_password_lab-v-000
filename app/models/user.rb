# https://learn.co/tracks/full-stack-web-development-v8/module-13-rails/section-12-authentication/using-has_secure-password-lab
# new code start
class User < ActiveRecord::Base
  has_secure_password
end
# new code end
