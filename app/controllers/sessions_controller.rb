class SessionsController < ApplicationController
  def new
    redirect_to root_path if current_user
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    return head(:forbidden) unless @user.authenticate(params[:user][:password])
    login @user
  end

  def destroy
    logout
    redirect_to sessions_new_path
  end

private

def login(user)
  session[:user_id] = user.id
end

  def logout
    if session.include? :user_id
      session.delete(:user_id) if !current_user.nil?
    end
  end
end
