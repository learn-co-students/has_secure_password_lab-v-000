class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    #params = {"user"=>{"name"=>"mickey", "password"=>"mouse"}, "commit"=>"log in", "controller"=>"sessions", "action"=>"create"}
    @user = User.find_by(name: params[:user][:name])
    if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to '/'
    else
        redirect_to sessions_new_path
    end

  end


  def destroy
    session.delete :user_id
    redirect_to '/'
  end
end
