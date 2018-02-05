class User < ApplicationRecord
	has_many :attendances, :foreign_key => :attendee_id
	has_many :attended_events, :through => :attendances
	has_many :created_events, :foreign_key => "creator_id", :class_name => "Event"
	has_many :invitations_sent, :foreign_key => "inviter_id", :class_name => "Invitation"
	has_many :invitations_received, :foreign_key => "invitee_id", :class_name => "Invitation"
	attr_accessor :remember_token
	before_save :downcase_email
	validates :username, presence: true, length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum: 255 }, 
						format: { with: VALID_EMAIL_REGEX },
						uniqueness: { case_sensitive: false }
	has_secure_password
	validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

	def self.digest(string)
		cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
	end

	private

		def downcase_email
			email.downcase!
		end
end
