class WelcomeController < ApplicationController
  def home
    @user = User.find_by(name: params[:name])
  end
end