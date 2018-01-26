sessions#create:

def create
  user = User.find_by(name: params[:user][:name])
  authenticated = user.try(:authenticate, params[:user][:password])

  if authenticated
    session[:user_id] = user.id
    flash[:message] = "You have successfully logged in!"
    redirect_to controller: 'welcome', action: 'greet_user'
  else
    flash[:message] = "Your attempt at logging in was unsuccessful. Please enter a valid username and password combination."
    redirect_to login_path # same as redirect_to controller: 'sessions', action: 'new'
  end
end

Explanation:
-try to find user instance whose name attribute value = params[:user][:name], i.e., whatever was submitted
 in the username field of the login form
-If a user instance with that name exists, user variable stores this user instance
-If no user instance exists with that submitted name, then user = nil, since #find_by returns nil

user.try(:authenticate, params[:user][:password]) means the following:
  # if user != nil
  #  user.authenticate(params[:user][:password])
  # else
  #   nil
  # end
 Meaning the following:
-If NO user instance exists whose name attribute value = name submitted in login form,
user = nil, so nil is returned, so authenticated = nil and else clause executes.
-If a user instance exists w/ name attribute = params[:user][:name] (from login form submission)
-check if user instance authenticates w/ params[:user][:password], i.e. value entered in password form field
-If the user DOES authenticate w/ the password submitted in login form,
user.authenticate(params[:user][:password]) returns the user instance (a truthy value)
-So authenticated = user instance (truthy value)
-If the user does NOT authenticate w/ the password submitted in the login form,
user.authenticate(params[:user][:password]) returns false,
-So authenticated = false

-If a user instance exists w/ the name submitted in the login form AND this user instance authenticates w/ the password submitted in the login form,
-log in the user by storing primary key id of user instance in session hash
-display a flash message on the user homepage (where user is redirected: app/views/welcome/greet_user.html.erb) to notify the user that their login was successful.
-authenticated = nil if no user existed with submitted name to begin with,
-or authenticated = false if user existed with name but did NOT authenticate with the submitted password
-Consequently, redirect the user to the login form again, where a message is displayed
to notify the user that they must enter a valid username and password combo


-The user's login form - app/views/sessions/new.html.erb - is submitted via a POST request to "/login" (returned by calling route helper method #login_path)
-This route is mapped to sessions#create.
When the login form is submitted, the params hash looks like this:
params = {
  "user" => {
  "name" => "whatever the user entered as their username in form field",
  "password" => "whatever the user entered as their password in form field"
  }
}
