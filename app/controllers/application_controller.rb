class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
  helper_method :valid_email?

  def authenticate!
   	redirect_to root_path and return if current_user.nil?
  end

  private

    def current_user
      @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
    end

    def valid_email?(email)      
      if email =~ /^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})$/
        return true
      else
        return false
      end
    end
end
