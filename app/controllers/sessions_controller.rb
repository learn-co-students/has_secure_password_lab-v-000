class SessionsController<ApplicationController

  require 'pry'

  def new

  end

  def create
    # binding.pry
    @user = User.find_by(:name=>params[:user][:name])
    return head(:forbidden) unless @user && @user.authenticate(params[:user][:password])

    session[:user_id] = @user.id
    render 'users/show'
  end

end
