class SessionsController < ApplicationController

  def create
    #binding.pry
    if params[:user][:password] != ""
      if user = User.find_by(name: params[:user][:name])
        if user.authenticate(params[:user][:password])
          session[:user_id] = user.id
          redirect_to '/welcome'
        else
          redirect_to '/login'
        end
      else
        redirect_to '/login'
      end
    else
      redirect_to '/login'
    end

  end

end
