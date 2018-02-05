module AttendancesHelper
	def attending?(event_id, invitee_id)
		Attendance.exists?(attended_event_id: event_id, attendee_id: invitee_id) 
	end
end