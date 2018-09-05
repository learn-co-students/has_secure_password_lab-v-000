class UsersController < ApplicationController

<<<<<<< HEAD
  def new
  end

  def create
    @user = User.create(user_params)
    return redirect_to controller: 'users', action: 'new' unless @user.save
    session[:user_id] = @user.id
    redirect_to controller: 'welcome', action: 'home'
  end

=======
>>>>>>> 283ac149c302bf5f249ba2e73a55cbfdb1dcc97d
end
