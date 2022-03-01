class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
   if @task.save
    redirect_to tasks_path
   else
     render 'new'
   end
  end

  def edit
    @task = Task.find_by(id: params[:id])
  end

  def show
    @task = Task.find_by(id: params[:id])
  end

  def update
    @task = Task.find_by(id: params[:id])
    if @task.update(task_params)
      redirect_to tasks_path
    else
      render 'edit'
    end
  end

  def destroy
    @task = Task.find_by(id: params[:id])
    @task.destroy
    redirect_to tasks_path
  end

  def complete
    @task = Task.find_by(id: params[:id])
    @task.update(completed: params[:completed])
    redirect_back fallback_location: tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :completed)
  end
end
