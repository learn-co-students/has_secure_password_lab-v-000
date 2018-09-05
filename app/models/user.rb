class User < ActiveRecord::Base
  has_secure_password

  # validates :name, presence: true
  # validates :name, uniqueness: true

  # validate :password_matches
  #
  #
  # def password_matches
  #   if self.password_confirmation == nil && self.password != nil && self.password != ""
  #     true
  #   elsif self.password == self.password_confirmation && self.password != nil
  #     true
  #   else
  #     false
  #   end
  # end

  # def authenticate(password_confirmation)
  #   if self.password == password_confirmation
  #     self
  #   else
  #     false
  #   end
  # end

end
