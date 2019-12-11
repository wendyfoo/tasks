class UsersController < ApplicationController
  skip_before_action(:force_user_sign_in, { :only => [:new_registration_form, :create] })
  
  def output
    render({ :template => "users/output.html.erb" })
  end
  
  def calculate
    input_minutes = params.fetch(:minutes).to_i
    # task_minutes = Task.pluck(:duration) 
    @task_list = []
    counter = 0 
    
    while input_minutes > 0
      a = @current_user.tasks.at(counter)
      task_minutes = a.duration
      input_minutes = input_minutes - task_minutes
      @task_list << a
      counter = counter + 1
    end

    respond_to do |format|
      format.json do
        render({ :json => user.as_json })
      end

      format.html do
        render({ :template => "users/output.html.erb" })
      end
    end    
  end
  
  def input
    the_username = params.fetch(:the_username)
    @user = User.where({ :username => the_username }).at(0)

    respond_to do |format|
      format.json do
        render({ :json => @user.as_json })
      end

      format.html do
        render({ :template => "users/input.html.erb" })
      end
    end
  end
  
  def index
    @users = User.all.order({ :username => :asc })

    respond_to do |format|
      format.json do
        render({ :json => @users.as_json })
      end

      format.html do
        render({ :template => "users/index.html.erb" })
      end
    end
  end 

  def new_registration_form
    render({ :template => "user_sessions/sign_up.html.erb" })
  end

  def create
    @user = User.new
    @user.email = true
    @user.password = params.fetch("password_from_query")
    @user.password_confirmation = params.fetch("password_confirmation_from_query")
    @user.username = params.fetch("username_from_query")

    save_status = @user.save

    if save_status == true
      session.store(:user_id,  @user.id)
      redirect_to("/", { :notice => "User account created successfully."})
    else
      redirect_to("/user_sign_up", { :alert => "User account failed to create successfully."})
    end
  end
    
  def edit_registration_form
    render({ :template => "users/edit_profile.html.erb" })
  end

  def update
    @user = @current_user
    @user.email = true
    @user.password = params.fetch("password_from_query")
    @user.password_confirmation = params.fetch("password_confirmation_from_query")
    @user.username = params.fetch("username_from_query")
    
    if @user.valid?
      @user.save

      redirect_to("/", { :notice => "User account updated successfully."})
    else
      render({ :template => "users/edit_profile_with_errors.html.erb" })
    end
  end

  def destroy
    @current_user.destroy
    reset_session
    
    redirect_to("/", { :notice => "User account cancelled" })
  end
  
end
