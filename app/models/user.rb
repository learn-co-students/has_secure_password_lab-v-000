class User < ActiveRecord::Base

  #validate :valid_user

  def authenticate(password)
    if password && password == self.password
      self
    else
      nil
    end
  end



  # def valid_user
  #   if self.password != self.password_confirmation
  #     errors.add(:password, "enter valid password")
  #   end
  # end



end