class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user

	private

	def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end
	
	def login_required
    if session[:user]
      return true
    end
    flash[:warning]='Please login to continue'
    session[:return_to]=request.url
    redirect_to "log in"
    return false 
  end
end
