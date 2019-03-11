class Api::ListsController < ApplicationController

  def index
    @lists = List.all 
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
