class User < ActiveRecord::Base
  has_secure_password

  def valid?
    if !!password == password_confirmation
      return true
    elsif !!password && !password_confirmation
      return true
    else
      return false
    end
  end
end
