Rails.application.routes.draw do



  # Routes for the Task resource:

  # CREATE
  match("/insert_task", { :controller => "tasks", :action => "create", :via => "post"})
          
  # READ
  match("/tasks", { :controller => "tasks", :action => "index", :via => "get"})
  
  match("/tasks/:id_from_path", { :controller => "tasks", :action => "show", :via => "get"})
  
  # UPDATE
  
  match("/modify_task/:id_from_path", { :controller => "tasks", :action => "update", :via => "post"})
  
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
