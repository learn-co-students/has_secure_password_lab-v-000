class StaticController < ApplicationController

  def hello
    if @user = User.find_by(id: session[:user_id])
      render 'hello'
    else
      redirect_to new_session_path
    end
  end
end
