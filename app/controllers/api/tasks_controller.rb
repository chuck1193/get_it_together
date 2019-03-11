class Api::TasksController < ApplicationController
  belongs_to :user, through :list

  def index
    @tasks = Tasks.all
    render 'index.json.jbuilder'
    
  end

  def create
    @task = Review.new(
                            name: params[:name],
                            content: params[:content],
                            priority: params[:priority],
                            status: params[:status]
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
    @task.priority = params[:status] || @task.status
 
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
