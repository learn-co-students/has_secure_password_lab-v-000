module SessionsHelper

  def current_user
    User.find_by(id: session[:user_id])
  end

  def logged_in?
    if current_user
      redirect_to user_path and return
    else
      redirect_to root_path and return
    end
  end

end
