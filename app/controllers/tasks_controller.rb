class TasksController < ApplicationController
  def add
    render({ :template => "tasks/add_new_task.html.erb" })
  end
  
  def index
    # @tasks = Task.where({:user_id => session[:user_id]}).order({ :created_at => :desc })
    @tasks = @current_user.tasks
    render({ :template => "tasks/index.html.erb" })
  end

  def show
    the_id = params.fetch("id_from_path")
    @task = Task.where({:id => the_id }).at(0)
    render({ :template => "tasks/show.html.erb" })
  end

  def create
    @task = Task.new
    @task.description = params.fetch("description_from_query")
    @task.category = params.fetch("category_from_query")
    @task.priority = params.fetch("priority_from_query")
    @task.deadline = params.fetch("deadline_from_query")
    @task.completed = params.fetch("completed_from_query", false)
    @task.user_id = session.fetch(:user_id)
    @task.duration = params.fetch("duration_from_query")

    if @task.valid?
      @task.save
      redirect_to("/tasks", { :notice => "Task created successfully." })
    else
      redirect_to("/tasks", { :notice => "Task failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("id_from_path")
    @task = Task.where({ :id => the_id }).at(0)

    @task.description = params.fetch("description_from_query")
    @task.category = params.fetch("category_from_query")
    @task.priority = params.fetch("priority_from_query")
    @task.deadline = params.fetch("deadline_from_query")
    @task.completed = params.fetch("completed_from_query", false)
    @task.user_id = params.fetch("user_id_from_query")
    @task.duration = params.fetch("duration_from_query")

    if @task.valid?
      @task.save
      redirect_to("/tasks", { :notice => "Task updated successfully."} )
    else
      redirect_to("/tasks/#{@task.id}", { :alert => "Task failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("id_from_path")
    @task = Task.where({ :id => the_id }).at(0)

    @task.destroy

    redirect_to("/tasks", { :notice => "Task deleted successfully."} )
  end
end
