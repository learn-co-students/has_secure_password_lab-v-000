class User < ActiveRecord::Base
  has_secure_password #adds two fields to model: password  and  password_confirmation

  #these two fields don't have a column in the User migration, instead they map to password_digest
  #password_digest column should be in User migration


end
