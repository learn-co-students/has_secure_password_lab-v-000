class WelcomeController < ApplicationController

    def hello
        redirect_to '/signup' unless logged_in?
    end
end

