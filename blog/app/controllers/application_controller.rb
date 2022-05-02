class ApplicationController < ActionController::Base
  helper_method :current_user
  def current_user
	if session[:user_id]
  	@current_user ||= User.find(session[:user_id])
	else
	@current_user = nil
	end
  end

	helper_method :current_auth
  def current_auth
	if session[:user_id]
  	@current_auth ||= Auth.find(session[:user_id])
	else
	@current_auth = nil
	end
  end

end
