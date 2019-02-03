class UsersController < ApplicationController


  def new #GET signup page
  end


  def create #POST signup -> create user
    if params[:user][:password] != params[:user][:password_confirmation]
      redirect_to action: "new"
    else
    @user = User.create(user_params)
    @user.save
    session[:user_id] = @user.id
    redirect_to controller: 'welcome', :action => 'show'
  end
  end

  def show #GET user welcome page
  end

 private

 def user_params
   params.require(:user).permit(:name, :password, :password_confirmation)
 end

end
