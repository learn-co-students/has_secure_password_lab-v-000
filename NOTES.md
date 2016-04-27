[x] 1. create User model and users migration
 - has_secure_password  
 - migration
   name
   password_digest

2. Users controller
  - get '/signup' => "users#new" => new.html.erb (signup form)
  - post '/signup' => "users#create"
      - remember strong params 

3. Sessions controller
  - get '/login' => "sessions#new" => new.html.erb (login form)
  - post '/login' => "sessions#create"


4. Welcome controller
  - get '/welcome' => "welcome#index" => index.html.erb
