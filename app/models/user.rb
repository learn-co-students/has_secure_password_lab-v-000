class User < ActiveRecord::Base
has_secure_password #need a password digest column

end
