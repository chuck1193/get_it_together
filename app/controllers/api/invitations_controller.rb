class Api::InvitationsController < ApplicationController
  def index
    @invitations = current_user.invitations
    render 'index.json.jbuilder'
  end

  def create
    @invitation = Invitation.new(
                                  list_id: params[:list_id],
                                  user_id: params[:user_id]
                                )
    if @invitation.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @invitation.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def show
    @invitation = Invitation.find(params[:id])
    render 'show.json.jbuilder'
  end

  def destroy
    invitation = Invitation.find(params[:id])
    invitation.destroy
    render json: {message: "Successfully Destroyed Invitation"}
  end
end
