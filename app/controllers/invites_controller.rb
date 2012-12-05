class InvitesController < ApplicationController
  def send_invite
    Invite.create params[:invite]
    render json: 'ok'
  end

  def index
    respond_to do |format|
      format.json { render json: Invite.all }
      format.html
    end
  end
end
