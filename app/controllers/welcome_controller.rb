class WelcomeController < ApplicationController
  def hello
    if current_user.nil?
      redirect_to '/login'
    end
  end
end
