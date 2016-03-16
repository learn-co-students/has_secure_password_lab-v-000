class WelcomeController < ApplicationController
  def hello
    @user = User.find_by(id: sessions[:user_id])
  end
end