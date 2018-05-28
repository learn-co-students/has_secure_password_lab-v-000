## Objectives

We're going to make a Rails app that covers a simple authentication flow: users can create accounts, log in, and log out.


[x] Create a User model and migrations.

[x] Create a Users controller. It should respond to `new` with the signup form, and respond to `create` by creating a new user.

[x] Create a Sessions controller and the appropriate actions.

[x] Create a user homepage. You can either create a controller for it (a `WelcomeController` is a reasonable thing that you'll see frequently), or you can make it an action in the User's controller.

[x] spec/models/user
[x] spec/controllers/users
[x] spec/controllers/session
