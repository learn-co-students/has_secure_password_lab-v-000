class WelcomeController < ApplicationController

  def index
    redirect_to sessions_new_path unless session.include? :user_id
  end

end
