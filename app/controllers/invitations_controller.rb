class InvitationsController < ApplicationController
	before_action :user_signed_in, only: :create
	before_action :creator_invites_only, only: :create

	def create
		@invite = Invitation.new(invite_params)
		@invite.inviter = current_user
    @invite.event_id = params[:invitation][:event_id]
		if @invite.save
			flash[:success] = "Invite sent!"
			redirect_to events_path(params[:invitation][:event_id])
		else
			redirect_to root_path
		end
	end

	private

		def invite_params
			params.require(:invitation).permit(:invitee_id, :event_id)
		end

		def user_signed_in
      redirect_to login_path unless logged_in?
    end

    def creator_invites_only
      redirect_to root_path unless current_user.created_events.include?(Event.find(params[:invitation][:event_id]))
    end
end
