class SessionsController < ApplicationController
  def login
    @user = User.new
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    if !@user.nil?
      if @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to users_url
      else
        return head(:forbidden)
      end
    else
      return head(:forbidden)
    end
  end

  private


end
