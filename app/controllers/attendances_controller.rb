class AttendancesController < ApplicationController
before_action :logged_in_user, only: :create
before_action :already_invited, only: :create

	def create
		@event = Event.find(params[:user][:attended_event_id])
		if invitation_exists?(@event.id, current_user.id)
			attendance = Attendance.new(attendance_params)
		end

		if attendance.save
			flash[:success] = "Attending event!"
			redirect_to events_path
		else
			flash[:danger] = "Something went wrong."
			redirect_to events_path 
		end
	end

	private
		def attendance_params
			params.require(:user).permit(:attendee_id, :attended_event_id)
		end

		def already_invited
			event_id = params[:user][:attended_event_id]
			if current_user.attended_events.exists?(event_id)
				flash[:danger] = "You're already attending!"
				redirect_to event_path(event_id)
			end
		end
end
