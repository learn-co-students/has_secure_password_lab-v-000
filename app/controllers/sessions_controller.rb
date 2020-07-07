class SessionsController < ApplicationController
  def new
    #nothing to do here
  end

  def create
    session[:name] = params[:name]
  end
end
