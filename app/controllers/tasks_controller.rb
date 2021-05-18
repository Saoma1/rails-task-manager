class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    find
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to task_path(@task)
  end

  def edit
    find
  end

  def update
    @task = find
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  def destroy
    @task = find
    @task.destroy
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title,:details,:completed)
  end

  def find
    @task = Task.find(params[:id])
  end


end
