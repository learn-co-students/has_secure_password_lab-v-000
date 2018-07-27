class User < ActiveRecord::Base

    def verifiy(params)
        if self.password == params[:user][:password] && self.password_confirmation == nil
            true
        elsif self.password_confirmation != nil && self.password_confirmation == self.password
            true
        else
            false
        end
    end

    def authenticate(pass)
        self.password_confirmation == pass ? self : nil

    end
end
