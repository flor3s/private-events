class EventsController < ApplicationController
	before_action :logged_in_user, only: [:new, :create]

	def index
		@event = Event.all
		@upcoming = @event.upcoming_events
		@past = @event.past_events
	end

	def new
		@event = Event.new
	end

	def create
		@event = current_user.created_events.build(event_params)
		if @event.save
      flash[:success] = "Event created!"
      redirect_to @event
    else
      render 'new'
    end
	end

	def show
		@event = Event.find(params[:id])
		@creator = @event.creator 
		@attending = @event.attendees
	end

	private

		def event_params
			params.require(:event).permit(:title, :description, :location, :event_date, :event_time)
		end
end
