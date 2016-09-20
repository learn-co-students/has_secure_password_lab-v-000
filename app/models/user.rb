class User < ActiveRecord::Base
    # validates :name, presence: true
    # validates :password, presence: true, confirmation: true
#Above lines cause 2 failures!

    has_secure_password
end
