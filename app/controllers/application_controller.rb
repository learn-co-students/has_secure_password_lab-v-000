class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    session[:name]
    #session[:user_id] = user.id
  end

  def authentication_required
    if !current_user
      redirect_to '/sessions/new'
    else
      redirect_to '/'
    end
  end

end
