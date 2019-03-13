class Api::ListsController < ApplicationController
  before_action :authenticate_user

  def index
    @lists = current_user.lists
    render 'index.json.jbuilder'  
  end

    def create
      @list = List.new(
                      name: params[:name]
                      )
      if @list.save
        render 'show.json.jbuilder'
      else
        render json: {errors: @list.errors.full_messages},status: :unprocessable_entity
      end
    end

    def show
      @list = List.find(params[:id])
      render 'show.json.jbuilder' 
    end

    def update
      @list = List.find(params[:id])

      @list.name = params[:name] || @list.name

      if @list.save
        render 'show.json.jbuilder'
      else
        render json: {errors: @list.errors.full_messages},status: :unprocessable_entity
      end
    end

    def destroy
      list = List.find(params[:id])
      list.destroy
      render json: {message: "Successfully Destroyed list"}
    end
  end
