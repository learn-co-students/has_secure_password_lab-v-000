require 'pry'
class SessionsController < ApplicationController
  def new
  end

  def create

      if !params[:user][:name] || params[:user][:name] == "" || !params[:user][:password] || params[:user][:password] == ""
                  flash[:message] = "Please fill In all the fields."
          redirect_to '/login'
      else
          @user = User.find_by(name: params[:user][:name])
            #binding.pry

          return head(:forbidden) unless @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to '/'
        end



    end

  def destroy
      session.delete :name
      redirect_to '/'
  end
  #
  # private
  #
  # def user_params
  #   params.require(:user).permit(:username,:password)
  # end

end
