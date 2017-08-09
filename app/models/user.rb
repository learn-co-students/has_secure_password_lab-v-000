class User < ActiveRecord::Base
  has_secure_password
	validates_presence_of :name
	validates_uniqueness_of :name
  validates_confirmation_of :password, message: 'should match original password'
	 # def password=(new_password)
  #   salt = BCrypt::Engine::generate_salt
  #   hashed = BCrypt::Engine::hash_secret(new_password, salt)
  #   self.password = salt + hashed
  # end
 
  # def authenticate(password)
  #   salt = password[0..28]
  #   hashed = BCrypt::Engine::hash_secret(password, salt)
  #   return nil unless (salt + hashed) == self.password
  # end
end
