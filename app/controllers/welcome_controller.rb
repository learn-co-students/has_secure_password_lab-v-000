class WelcomeController < ApplicationController

  def index
    @user = User.find_by(id: session[:user_id])
    if @user
      @greeting_name = @user.name
    else
      @greeting_name = 'Guest'
    end
  end

end
