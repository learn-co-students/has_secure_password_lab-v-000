class User < ActiveRecord::Base
    
    def self.authenticate(password)
   @user = User.new(params_user)
    @user.password == @user.password_confirmation
    @user
end

    private
    def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end

