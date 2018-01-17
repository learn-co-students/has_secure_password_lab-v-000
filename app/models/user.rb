class User < ActiveRecord::Base
  validate :password_and_confirmation_match

  def password_and_confirmation_match
    #binding.pry
    if !self.password_confirmation.nil?
      if self.password != self.password_confirmation
        errors.add(:password_confirmation, "Password and confirmation don't match")
      end
    end
  end

  def authenticate(auth_password)
    if auth_password == self.password
      self
    else
      false
    end
  end


end
