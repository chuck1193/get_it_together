class Api::InvitationsController < ApplicationController
  def create
    @invitation = Invitation.new(
                                  list_id: params[:list_id],
                                  user_id: params[:user_id]
                                )
    if @invitation.save
      render 'index.json.jbuilder'
  end

  def destroy
    invitation = Invitation.find(params[:id])
    invitation.destroy
    render json: {message: "Successfully Destroyed Invitation"}
  end
end
