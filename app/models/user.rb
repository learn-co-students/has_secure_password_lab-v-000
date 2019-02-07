class User < ActiveRecord::Base
    validates :password, confirmation: true

    def authenticate(input)
        if self.password == input 
            user = self 
        else
            user = false
        end
        user
    end
end
