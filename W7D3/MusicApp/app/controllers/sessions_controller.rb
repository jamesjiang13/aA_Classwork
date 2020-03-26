class SessionsController < ApplicationController

    def new
        if current_user
            redirect_to user_url(current_user) # User#show
        else
            render :new
        end
    end

    def create
        # 1. find user in the db
        @user = User.find_by_credentials(params[:user][:email], params[:user][:password])

        # 2. check if user exists
        if @user
            log_in_user!(@user) # log in if exists
            redirect_to user_url(@user)
        else
            render :new # else render login page again
        end
    end


    def destroy # to log out
        logout!
        redirect_to new_sessions_url
    end
end
