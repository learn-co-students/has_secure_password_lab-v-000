class WelcomeController < ApplicationController
  def home
    @user = User.find_by(id: params[:user_id])
  end
end