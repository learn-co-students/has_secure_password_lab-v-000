require 'pry'
class SessionsController < ApplicationController
  before_action :require_account

  def new
  end

  def create
    binding.pry
    session[:user_id] = @user.id
  end

  private

    def require_account
      binding.pry
      redirect_to '/users/new' unless params[:password]
    end

end
