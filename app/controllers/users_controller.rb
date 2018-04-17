class UsersController <  ApplicationController
  def new
  end
  def create
  #    if user=User.find_by_name(params[:name])
  #       flash[:message] = "Username already exists"
  # return  redirect_to controller:'users', action:'create'

if params[:user][:name].empty?
  flash[:message]= "You must include a username"
  return  redirect_to controller:'users', action:'create'
else
    if params[:user][:password] == params[:user][:password_confirmation]
  #redirect_to controller: 'users', action: 'new' and return if !params[:name]|| params[:name].empty?
  @user=  User.create(name: params[:user][:name], password: params[:user][:password])
session[:user_id] = @user.id

redirect_to controller:'users', action:'home'

else
  redirect_to controller:'users', action:'create'
end
 end
end
  def home
    @user= User.find(session[:user_id])

  end
end
