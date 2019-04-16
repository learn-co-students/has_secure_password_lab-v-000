class UsersController < ApplicationController

  def create
    @user = User.create(user_params)
      if @user.id == nil || (params[:user][:password] != params[:user][:password_confirmation])
        redirect_to '/users/new'
      return
      else
       session[:user_id] = @user.id
     end
  end


  def homepage
  end



  private

def user_params
  params.require(:user).permit(:name, :password, :password_confirmation)
end

end
