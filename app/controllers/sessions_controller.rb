class SessionsController < ApplicationController

 def create
   user = User.find_by(name: params[:user][:name])
    user = user.try(:authenticate, params[:user][:password])
    return redirect_to(controller: 'sessions', action: 'new') unless user
    session[:user_id] = user.id
    @user = user
    redirect_to controller: 'users', action: 'new'
 end


private

def user_params
   params.require(:user).permit(:name, :password, :password_confirmation)
end

end
