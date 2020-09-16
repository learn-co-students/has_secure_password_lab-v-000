class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(name:params[:user][:name], 
                     email:params[:user][:email], 
                     password:params[:user][:password],
                     password_confirmation:params[:user][:password_confirmation]
                    )
    # where do the passwords get compared?
    # after new/create is called
    
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Successfully Created Account"
      redirect_to root_path
    else
      flash[:alert] = @user.errors.full_messages
      redirect_to '/users/new'
    end

  end

end