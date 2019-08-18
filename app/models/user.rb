class User < ApplicationRecord
    validates :password, presence: true
    validate :password_and_password_confirmation

    def authenticate(password)
        # matches password param from session#new against found user.password
    end

    def password_and_password_confirmation
        if password_confirmation.present?
            unless password_confirmation === password
                errors.add(:password_confirmation, "Must Match Password")
            end
        end
    end
end
