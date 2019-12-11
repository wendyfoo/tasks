class UserSessionsController < ApplicationController
  skip_before_action(:force_user_sign_in, { :only => [:new_session_form, :add_cookie] })
  
  def new_session_form
    render({ :template => "user_sessions/sign_in.html.erb" })
  end

  def add_cookie
    the_username = User.where({ :username => params.fetch("username_from_query")}).at(0)
    the_supplied_password = params.fetch("password_from_query")
    
    if the_username != nil
      are_they_legit = the_username.authenticate(the_supplied_password)
    
      if are_they_legit == false
        redirect_to("/user_sign_in", { :alert => "This is awkward. Your password is incorrect." })
      else
        session[:user_id] = the_username.id
        redirect_to("/tasks", { :notice => "Signed in successfully." })
      end

    else
      redirect_to("/user_sign_in", { :alert => "This is awkward. There's no user account with that username." })
    end
  end

  def remove_cookies
    reset_session
    redirect_to("/", { :notice => "Signed out successfully." })
  end
 
end
