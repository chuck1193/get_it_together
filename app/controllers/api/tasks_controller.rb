class Api::TasksController < ApplicationController
   # before_action :authenticate_user

  def index
    @tasks = current_user.tasks
    render 'index.json.jbuilder'
    
  end

  def create
    @task = Task.new(
                    list_id: params[:list_id],
                    name: params[:name],
                    content:params[:content],
                    priority: params[:priority],
                    status: "pending",
                    deadline: params[:deadline],
                    category: params[:category]
                    )
    if @task.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @task.errors.full_messages},status: :unprocessable_entity
    end
  end

  def show
    @task = Task.find(params[:id])
    render 'show.json.jbuilder'
  end

  def update
    @Task = Task.find(params[:id])

    @task.name = params[:name] || @task.name
    @task.content = params[:content] || @task.content
    @task.priority = params[:priority] || @task.priority
    @task.status = params[:status] || @task.status
    @task.deadline = params[:status] || @task.deadline
    @task.category = params[:category] || @task.category
 
    if @task.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @task.errors.full_messages},status: :unprocessable_entity
    end
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy
    render json: {message: "Successfully Destroyed Task"}
  end
end
