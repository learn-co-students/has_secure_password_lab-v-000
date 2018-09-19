class WelcomeController < ApplicationController
  def show
    if logged_in?
      render 'show'
    else
      redirect_to 'users/new'
    end
  end
  
end
