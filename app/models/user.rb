class User < ActiveRecord::Base
    has_secure_password 
    #Rails provides a method called has_secure_password that you can use on your ActiveRecord models to handle salting.
end