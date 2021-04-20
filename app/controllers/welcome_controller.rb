class WelcomeController < ApplicationController

    def new
      @user = User.find(id => params[:id])
    end

end