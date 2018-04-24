class SessionsController < ApplicationController

  def new
  end

  def create
    if params[:password].blank? || params[:password_confirmation].blank?
      redirect_to '/login'
    elsif
      @user=User.find_by(name: params[:name])
        return head(:forbidden) unless @user.authenticate(params[:password])
        session[:user_id]=@user.id
        redirect_to '/users/homepage'
    end
  end

end
