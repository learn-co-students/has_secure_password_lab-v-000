class WelcomeController < ApplicationController
  def hello
    redirect_to new_session_path if session[:user_id].nil?
  end
end
