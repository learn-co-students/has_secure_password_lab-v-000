class SessionsController

  def new
    render :login
  end


  def create
    @user = User.find_by(name: params[:name])
    return head(:forbidden) unless @user.authenticate(params[:password])
    session[:user_id] = @user.id
  end


  def create
    @user = User.find_by(name: params[:name])
    @user = @user.try(:authenticate, params[:password])
    if @user
      session[:user_id] = @user.id
      redirect_to welcome_path
    else
      redirect_to login_path
    end
  end


end
