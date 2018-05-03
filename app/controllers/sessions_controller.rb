class SessionsController < ApplicationController

	  def create
	    if params[:user][:name].blank? ||  params[:user][:password].blank?
	      redirect_to '/login'
	    else
	      if @user=User.find_by(name: params[:user][:name])
	        if @user.authenticate(params[:user][:password])
	          session[:user_id]=@user.id
	          redirect_to '/users/homepage'
	        else
	          redirect_to '/login'
	        end
	      end
	    end
	  end

	  def destroy
	    session.delete :name
 	   redirect_to '/login'
 	 end
	end
