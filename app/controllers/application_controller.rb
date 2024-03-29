class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user

	private

	def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end
	
	def login_required
	redirect_to('/login') if current_user.blank?
  end
end
