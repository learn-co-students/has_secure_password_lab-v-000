class User < ActiveRecord::Base
	has_secure_password
end



  # validates :email, presence:true, format: { with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/ }, uniqueness:true
  # validates :name, presence:true, length:{within:6..32} , format: {with: /^[a-zA-Z0-9_ ]*$/, message:"can contain alphabets, numbers and underscores only"}
  # validates :password, presence:true, length:{within:8..32}, confirmation:true