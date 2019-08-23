class User < ActiveRecord::Base
    has_secure_password
    validates :password, presence: true
    validates :password, uniqueness: true
end
