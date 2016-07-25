class User < ActiveRecord::Base



def authenticate(password)
   if self.password == password
   self
   end  
end


def valid_user
  self.password_confirmation == self.password && self.password_confirmation != nil && self.password != nil && self.password != "" && self.password_confirmation != ""
end


end
