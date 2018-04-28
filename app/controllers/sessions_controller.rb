class SessionsController < ApplicationController



  def create
    @user = User.find_by(name: params[:user][:name])
    if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to '/users/home'
    else
        redirect_to '/users/new'
    end
  end


  def destroy
    session.delete :name if session[:name] = params[:name]
    redirect_to '/logout'
  end

end
