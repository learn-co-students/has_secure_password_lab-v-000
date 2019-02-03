class SessionsController < ApplicationController


def new #GET login page
end

def create #logging in POST
  @user = User.find_by(name: params[:user][:name])
  return head(:forbidden) unless @user.authenticate(params[:user][:password])
  session[:user_id] = @user.id
  redirect_to controller: 'welcome', action: 'show'
end


def destroy
  session.delete :user_id
end

def user_params
  params.require(:user).permit(:name, :password, :password_confirmation)
end






end
