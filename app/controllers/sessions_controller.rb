class SessionsController < ApplicationController

  helper_method :login

  def new

  end

  def create
    user = User.find_by(name: params[:user][:name])

    return head(:forbidden) unless user.authenticate(params[:user][:password])

    login(user)

    redirect_to '/users'
  end

end
