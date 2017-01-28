class User < ActiveRecord::Base
  validate :pass_verify

  def pass_verify
    if password == password_confirmation && !password_confirmation.nil?
    else
      if !password.nil? && password_confirmation.nil?
      else
        errors.add(:password, "Passwords must match.")
      end
    end
  end

  def authenticate(pass)
    if pass == password
      return self
    else
      false
    end
  end

end
