class TasksController < ApplicationController
  before_action :set_task, only: [:show, :update, :destroy]

  #GET/tasks
  def index
    @tasks = Task.all
    render json: @tasks
  end

  #GET/tasks/1
  def show
    render json: @task
  end

  #Post/tasks
  def create
    @task = Task.new(task_params)

    if @task.save
      render json: @task, status: :created, location: @task
    else
      render json: @task.errors. status: :unprocessable entity
    end
  end

  #PATCH/PUT/tasks/1
  def update
    if @task.update(task params)
      render json: @task
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  #delete
  def destroy
    @task = Task.find(params[:id])
  end

  def task params
    params.require(:task).permit(:title, :description, :completed)
  end
end
