class User < ActiveRecord::Base
  has_secure_password

  def login
  end
end
