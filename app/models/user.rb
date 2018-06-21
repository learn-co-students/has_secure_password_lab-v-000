class User < ActiveRecord::Base
  # validates :password, confirmation: true
  # validates :password_confirmation, presence: true
  validate :password_validation

  # is invalid if password and password_confirmation are both non-nil and don't match
  def password_validation
    if self.password_confirmation != nil && self.password != nil && self.password_confirmation != self.password
      errors.add(:password, "this is wrong")
    end
  end

  def authenticate(pass)
    if (pass == self.password)
      self
    else
      false
    end
  end
end
