class User < ActiveRecord::Base
  attr_accessor :password_confirmation
  validate :validate_password

  def validate_password
    if self.password_confirmation and self.password != self.password_confirmation
      errors.add(:password_confirmation, "Password and Password confirmation do not match.")
    end
  end

  def authenticate(password)
    self if self.password == password
  end
end
