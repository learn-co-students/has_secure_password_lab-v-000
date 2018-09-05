3 Pages:

A signup page, where the user enters their username, password, and password confirmation.

A login page, where the user submits their username and password and are logged in.

A user homepage, which says, "Hi, #{username}."

Directions:

Create a User model and migrations. (Check)

Create a Users controller. It should respond to new with the signup form, and respond to create by creating a new user.

Create a Sessions controller and the appropriate actions.

Create a user homepage. You can either create a controller for it (a WelcomeController is a reasonable thing that you'll see frequently), or you can make it an action in the User's controller.
