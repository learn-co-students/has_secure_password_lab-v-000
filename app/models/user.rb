class User < ActiveRecord::Base
  has_secure_password
  validates :password, presence: true
  # validates :password_confirmation, presence: true
  validates_confirmation_of :password
  # validate :passwords_must_match
  #
  # def passwords_must_match
  #   :password == :password_confirmation
  # end
end
