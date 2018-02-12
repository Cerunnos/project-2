class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

#if current user doesnt exist
#redirct to login again
 def is_authenticated?
   if !current_user
     flash[:message] = 'You must be logged in'
     redirect_to root_path
   end
 end

 #if current user exist return it back to me
 # else set current user.
 #the program only makes two querys to the data Base
 #program more efficient
 def current_user
   @current_user||= User.find_by(id: session[:user_id])
 end


 def logged_in?
   !!current_user
 end

end
