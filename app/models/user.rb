class User < ActiveRecord::Base
  has_secure_password

  def username
    self.name
  end
end
