class Api::UsersController < ApplicationController
  before_action :authenticate_user, except: [:create] || invited_guests

  def index
    @users = User.all
    render 'index.json.jbuilder'
  end

  def create
    user = User.new(
                    first_name: params[:first_name],
                    last_name: params[:last_name],
                    email: params[:email],
                    password: params[:password],
                    password_confirmation: params[:password_confirmation] 
                  )
    if user.save
      render json: {message: "User created Successfully"}, status: :created
    else
      render json: {errors: user.errors.full_messages}, status: :bad_request
    end
  end

  def show
    @user = User.find(params[:id])
    render 'show.json.jbuilder'
  end

  def update
    @user = User.find(params[:id])

    @user.first_name = params[:first_name] || @user.first_name
    @user.last_name = params[:last_name] || @user.last_name
    @user.email = params[:email] || @user.email
    @user.password = params[:password] || @user.password
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    render json: {message: "Successfully Destroyed User"}
  end
end
