class WelcomeController < ApplicationController
  def index
    @user = User.find(params[:id])
  end
end
