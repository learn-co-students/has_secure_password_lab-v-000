class SessionsController < ApplicationController

  def new
  end

  def create
    if params[:name] && params[:password]
      user = User.find_by(name: params[:name])
      if user.password == params[:password]
        session[:user_id] = user.id
      end
    end
  end
end
