class ApplicationController < ActionController::Base

    helper_method :current_user, :logged_in?

    def current_user
        return nil if session[:session_token].nil?
        # user = User.find_by(session_token: session[:session_token])
        @user ||= User.find_by(session_token: session[:session_token])
    end

    def logged_in?
        user.session_token == session[:session_token]
    end

    def log_in_user!(user)
        session[:session_token] = user.reset_session_token!
        # how does this log in the user?
    end

    def logout!
        # gives user a new cookie so hackers cant see old cookie
        current_user.try(:reset_session_token!) 
        
        # clears out the current cookie on server
        session[:session_token] = nil

        # removes the current user
        @current_user = nil
    end


end
