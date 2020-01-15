class UsersController < ApplicationController
  def new 
    # The README says to use #new, but #signup makes more sense to me. However, #signup fails the tests.
    @user = User.new
    render :signup # That probably goes against convention, but it makes the view file easier to find.
  end

  def create
    @user = User.new(user_params)
    
    # To allow users to leave the Password Confirmation blank:
    if @user.password_confirmation.blank?
      @user.password_confirmation = nil
    end

    if @user.save
      session[:user_id] = @user.id
      flash.alert = "You have successfully signed up!"
      redirect_to home_path
    else
      flash[:errors] = @user.errors.full_messages
      # flash.alert = @user.errors.full_messages.first
      # render :signup
      # raise @user.errors.inspect
      
      redirect_to signup_path # Definitely not the way I prefer; I'd rather render the signup page.
      # Also, since there's no #signup action, it's not clear where this redirects to (unless you check the routes).
    end
  end

  def home
    unless current_user
      flash.alert = "You are not allowed to access that page."
      redirect_to login_path
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :password, :password_confirmation)
    end
end
