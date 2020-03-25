class SessionsController < ApplicationController
    
    def new
        if !current_user
            render :new
        else
            redirect_to cats_url
        end
    end

    def create
        @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
        
        if @user
            login!(@user)
            redirect_to cats_url
        else
            redirect_to new_session_url
        end
    end

    def destroy
        # @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
        current_user.reset_session_token!
        session[:session_token] = nil
        redirect_to cats_url
    end

end
