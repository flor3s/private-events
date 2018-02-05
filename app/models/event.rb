class Event < ApplicationRecord
	has_many :attendances, :foreign_key => :attended_event_id
	has_many :attendees, :through => :attendances
	has_many :invitations
	belongs_to :creator, :class_name => 'User'
	scope :upcoming_events, -> { where("event_date > ?", Time.now) }
  scope :past_events, -> {where("event_date < ?", Time.now) }
end
