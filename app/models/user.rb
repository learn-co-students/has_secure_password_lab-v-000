class User < ActiveRecord::Base
	validate :passwords_are_equal

	def passwords_are_equal
		if password != password_confirmation
			errors.add(:passwords_are_equal, "does not match confirmation") unless password_confirmation.nil?
		end
	end

	def authenticate(password_to_check)
    return nil unless password_to_check == self.password
    self
  end
end
