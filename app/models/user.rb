class User < ApplicationRecord
  has_many :users

  def authenticate(params)
    
  end

end
