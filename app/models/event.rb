class Event < ApplicationRecord
	belongs_to :creator, :class_name => "User"
	scope :upcoming_events, -> { where("event_date > ?", Time.now) }
  scope :past_events, -> {where("event_date < ?", Time.now) }
end
