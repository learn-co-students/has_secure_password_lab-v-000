class SessionsController < ApplicationController

  def create
    @user = User.find_by(params[:id])
    return head(:forbidden) unless @user.authenticate(params[:password])
    session[:user_id] = @user.id
    render session_path
  end

  def show
  end

end


#  post create
#     logs you in with the correct password (FAILED - 1)
#     rejects invalid passwords (FAILED - 2)
#     rejects empty passwords (FAILED - 3)

#       sessions POST /sessions(.:format)     sessions#create
# new_session GET  /sessions/new(.:format) sessions#new
#     session GET  /sessions/:id(.:format) sessions#show