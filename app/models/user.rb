class User < ActiveRecord::Base
  has_secure_password

  def valid?
    !!password && !password_confirmation
  end
end
