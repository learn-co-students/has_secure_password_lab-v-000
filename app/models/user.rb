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

end
