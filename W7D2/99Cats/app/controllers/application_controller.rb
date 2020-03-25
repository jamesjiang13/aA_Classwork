class ApplicationController < ActionController::Base

    def require_current_user!
        redirect_to new_session_url if current_user.nil?
    end
    
    helper_method :current_user

    def current_user
        @current_user ||= User.find_by(session_token: session[:session_token])
    end

    
    # user logs in, this gives them a cookie for the session
    def login!(user)
        # session_token never changes
        # session_token shouldn't hang, need to regen new one
        session[:session_token] = user.reset_session_token!
        # this will update session token, add new to db
        # this is just a cookie
    end


end
