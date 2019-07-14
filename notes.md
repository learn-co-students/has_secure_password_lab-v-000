1. A signup page, where the user enters their username, password, and password confirmation.

    route               temple and priest name (controller)
get /users/new                  users#new

this then renders a new user sign up form
  - asks for :email
  - asks for password
  - asks for password confirmation

The form is filled out by the user, then is sent to the next
priest in the same temple. the next action in the same controller.

    route               temple and priest name (controller)
    post /users                  users#create

    the create method will communicate with the User model. Asking it to:
    (i) instantiate the user
      user = User.new(user_params)
    (ii) save the user to the db  
      user.save
    if validation fails and the user is not persisted to the db, there will be
    a simple re-render of the new user form, highlighting why the creation of
    a new user has failed, and asking for the correct and complete information
    to be supplied.
      render '/users/new'

    if validation succeeds and the user is in fact persisted to the db, then
    there will be an additional step before redirecting the user.
    (i) sign the user in
      session[:user_id] = user.id
    (ii) redirect_to the user homepage


    Logging in

    route               temple and priest name (controller)
  get /login                  sessions#new

    This will render the login page

    Login page will be a form using basic rails form tags, (no form_builder)
    and will ask for the username or email and the password.

    route               temple and priest name (controller)
  post /login                  sessions#create

  Create method in sessions controller will pull up the user using the email
    - user = User.find_by(:email => params[:user][:email])
  Will then compare the inputted password with the encrypted password using authenticate
    - user.authenticate(params[:user][:password])
  if authentication passes, then will sign the user in and redirect:
    - session[:user_id] = user.id # this can be refactored to log_in which may even user a helper method called current_user.
    - redirect_to user homepage
  if authentication fails, then




On some controller you can write a macro,like before_action, that will call a method before each action is performed.

helper methods for authentication

before action :authentication_required

def authentication_required
  if !logged_in?
   redirect login_path
  end

def logged_in?
  !!current_user
end

def current_user
  @current_user ||= User.find(session[:user_id]) if session[:user_id]
end


    story line:

  The create priest will communicate with the high priest for users,
  who will run the necessary checks, communicating with the infinite
  knowledge pool. and will then give an answer back to the distro priest.

  If the user has submitted the necessary information and there is no conflict with the infinite library, then the distro priest will sign the user in,
  and redirect them to the user home page.

  if the user has any conflicting information then the distro priest will tell the messenger to relay to the user that the request has not been fulfilled and what he can do to rectify it.
