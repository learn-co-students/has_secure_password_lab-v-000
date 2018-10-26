class SessionsController < ApplicationController
  def create
    if !current_user
      # binding.pry
      @user = User.find_by(name: params[:user][:name])
      return head(:forbidden) unless @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to '/application/home'
    else
      redirect_to '/login'
    end
  end
end
