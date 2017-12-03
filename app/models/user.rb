class User < ActiveRecord::Base
  has_secure_password

  # validate :password_confirmation_validation
  #
  # def password_confirmation_validation
  #   if self.password and !self.password.empty? and
  #   self.password_confirmation and !self.password_confirmation.empty? and
  #   self.password != self.password_confirmation
  #     errors.add(:password, "and password confirmation do not match!")
  #   end
  # end
  #
  # def authenticate(pass)
  #   self if self.password == pass
  # end
end
