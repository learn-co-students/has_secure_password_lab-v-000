
[1mFrom:[0m /home/daniel/code/labs/has_secure_password_lab-v-000/app/controllers/sessions_controller.rb @ line 8 SessionsController#create:

     [1;34m5[0m: [32mdef[0m [1;34mcreate[0m
     [1;34m6[0m:   @user = [1;34;4mUser[0m.find_by([35mname[0m: params[[33m:name[0m])
     [1;34m7[0m:   binding.pry
 =>  [1;34m8[0m:   [32mif[0m !@user.nil?
     [1;34m9[0m:     redirect_to [31m[1;31m'[0m[31m/login[1;31m'[0m[31m[0m [32munless[0m @user.authenticate(params[[33m:password[0m])
    [1;34m10[0m:     session[[33m:user_id[0m] = @user.id
    [1;34m11[0m:   [32melse[0m
    [1;34m12[0m:     redirect_to [31m[1;31m'[0m[31m/login[1;31m'[0m[31m[0m
    [1;34m13[0m:   [32mend[0m
    [1;34m14[0m: [32mend[0m

