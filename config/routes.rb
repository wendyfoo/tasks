Rails.application.routes.draw do

  # Routes for User Profile:

  # DISPLAY
  match("/user", { :controller => "users", :action => "index", :via => "get"})

  # INPUT
  match("/user/:the_username", { :controller => "users", :action => "input", :via => "get"})

  # OUTPUT
  match("/user/:the_username/calculate", { :controller => "users", :action => "calculate", :via => "get"})
  match("/user/:the_username/output", { :controller => "users", :action => "output", :via => "get"})

  #------------------------------

  # Routes for the Task:

  # CREATE
  match("/add_new_task", { :controller => "tasks", :action => "add", :via => "get"})
  match("/insert_task", { :controller => "tasks", :action => "create", :via => "post"})
          
  # READ
  match("/tasks", { :controller => "tasks", :action => "index", :via => "get"})
  match("/", { :controller => "tasks", :action => "index", :via => "get"})
  match("/tasks/:id_from_path", { :controller => "tasks", :action => "show", :via => "get"})

  # UPDATE
  match("/modify_task/:id_from_path", { :controller => "tasks", :action => "update", :via => "post"})
  match("/completed_task/:id_from_path", { :controller => "tasks", :action => "completed", :via => "post"})
  match("/generated_task/:id_from_path", { :controller => "tasks", :action => "generated", :via => "get"})

  # DELETE
  match("/delete_task/:id_from_path", { :controller => "tasks", :action => "destroy", :via => "get"})

  #------------------------------

  # Routes for signing up

  match("/user_sign_up", { :controller => "users", :action => "new_registration_form", :via => "get"})
  
  # Routes for signing in
  match("/user_sign_in", { :controller => "user_sessions", :action => "new_session_form", :via => "get"})
  match("/user_verify_credentials", { :controller => "user_sessions", :action => "add_cookie", :via => "post"})
  
  # Route for signing out
  match("/user_sign_out", { :controller => "user_sessions", :action => "remove_cookies", :via => "get"})
  
  # Route for creating account into database 
  match("/post_user", { :controller => "users", :action => "create", :via => "post" })
  
  # Route for editing account
  match("/edit_user", { :controller => "users", :action => "edit_registration_form", :via => "get"})
  match("/patch_user", { :controller => "users", :action => "update", :via => "post"})
  
  # Route for removing an account
  match("/cancel_user_account", { :controller => "users", :action => "destroy", :via => "get"})

  #------------------------------

  # ======= Add Your Routes Above These =============
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
