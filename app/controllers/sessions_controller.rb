class SessionsController < ActionController::Base

  def new
  end

  def create
    user = User.find_by(:name => params[:user][:name]) unless !User.find_by(:name => params[:user][:name])
    if user.authenticate(params[:user][:password])
      @user = user
      session[:user_id] = @user.id
      render '/users/show'
    else
      redirect_to '/login'
    end
  end

  def login

  end

  def delete
    if session[:name]
      session.delete :name
    end
    redirect_to '/login'
  end


end
