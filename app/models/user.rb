class User < ActiveRecord::Base

  validates :name, presence: true
  validates :name, uniqueness: true

  validate :password_matches


  def password_matches
    if self.password == self.password_confirmation
      true
    else
      false
    end
  end

  def authenticate(password_confirmation)
    if self.password == password_confirmation
      self
    else
      false
    end
  end

end
