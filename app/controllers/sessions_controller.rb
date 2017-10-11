class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(name: params.require(:user)[:name])
    return head(:forbidden) unless @user.authenticate(params.require(:user)[:password])
    session[:user_id] = @user.id
    redirect_to '/users/show'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find_by(name: params[:name])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :password, :password_confirmation)
    end

end
