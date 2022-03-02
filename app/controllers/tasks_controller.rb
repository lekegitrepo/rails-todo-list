class TasksController < ApplicationController
  before_action :confirm_login
  before_action :load_task, :confirm_task_owner, except: [:new, :index, :create]
  def index
    @tasks = current_user.tasks.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.build(task_params)
   if @task.save
    redirect_to tasks_path
   else
     render 'new'
   end
  end

  def edit
  end

  def show
  end

  def update
    if @task.update(task_params)
      redirect_to tasks_path
    else
      render 'edit'
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  def complete
    @task.update(completed: params[:completed])
    redirect_back fallback_location: tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :completed)
  end

  def confirm_login
    unless current_user
      redirect_to root_path, alert: 'You must login to view your tasks!'
    end
  end

  def confirm_task_owner
    if @task && current_user != @task.user
      redirect_to tasks_path, alert: 'You do not have permission to access this task!'
    end
  end

  def load_task
    @task = Task.find_by(id: params[:id])
  end
end
