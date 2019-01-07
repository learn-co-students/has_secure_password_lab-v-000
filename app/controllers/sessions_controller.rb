class SessionsController < ApplicationController
  def new
  end

  def create 
    # raise params.inspect      
    @user = User.find_by(name: params[:user][:name])
    return head(:forbidden) unless @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
    render welcome_index_path
  end

  def destroy
  end 
  
end
