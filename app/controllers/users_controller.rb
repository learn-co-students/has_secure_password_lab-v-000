class UsersController < ApplicationController

def index
end

def new
end

def create
  if !params[:user][:name] || params[:user][:name] == "" || !params[:user][:password] || params[:user][:password] == ""|| !params[:user][:password_confirmation]|| params[:user][:password_confirmation] == ""|| params[:user][:password] != params[:user][:password_confirmation]
      flash[:message] = "Please fill In all the fields."
      redirect_to '/users/new'

  else
      user = User.new(name: params[:user][:name],password: params[:user][:password])
      if user.valid?
        user.save
        return head(:forbidden) unless user.authenticate(params[:user][:password])
        session[:user_id] = user.id
        redirect_to '/'
      end
  end

end





end
