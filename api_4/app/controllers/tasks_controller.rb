class TasksController < ApplicationController
  before_action :set_task, only: [:show, :update, :destroy]

  #get/tasks
  def index
    @tasks = Task.all
    render json: @tasks
  end

  #GET/tasks/1
  def show
    render json: @task
  end

  #post/tasks
  def create
    @task = Task.new(task.params)

    if @task.save
      render json: @task, status: :created, location: @task
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  #patch
  def update
    if @task.update(task_params)
      render json: @task
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  #delete
  def destroy
    @task.destroy
  end

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :description, :completed)
  end
end
