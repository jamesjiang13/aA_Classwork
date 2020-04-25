class ApplicationController < ActionController::Base
  helper_methods :current_user, :loggedin 
  
  def current_user
    @current_user||= User.find_by(session_token: session[:session_token])
  end

  def require_signedin
    redirect_to new_session_url unless loggedin
  end

  def login(user)
    @current_user = user 
    session[:session_token] = user.reset_session_token
  end
  
  def logout
    current_user.reset_session_token!
    sessions[:session_token] = nil
    @current_user = nil
  end
  
  def loggedin
    !!current_user
  end
end
