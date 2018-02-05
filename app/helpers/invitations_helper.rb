module InvitationsHelper
	def invitation_exists?(event_id, invitee_id)
		Invitation.exists?(event_id: event_id, invitee_id: invitee_id) 
	end
end