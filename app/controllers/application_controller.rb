class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  include InvitationsHelper
  include AttendancesHelper
  
  private

  	def logged_in_user
  		unless logged_in?
  			flash[:danger] = "Log in to visit this page."
  			redirect_to login_url
  		end
  	end
end
