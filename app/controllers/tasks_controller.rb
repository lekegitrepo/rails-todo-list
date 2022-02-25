class TasksController < ApplicationController
  def index
    @tasks = ['Reading', 'Writing', 'Creating', 'Washing']
  end

  def new
  end
end
