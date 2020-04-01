class SessionsController < ApplicationController

    before_action :require_signed_in!, only: [:destroy]
    def new
        # @user = User.find_by(session_token: session[:session_token])
        render :new
    end

    def create
        @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
        if @user
            sign_in!(@user)
            redirect_to user_url(@user)
        else
            flash[:errors] = ['Incorrect username or password']
            render :new
        end
    end

    def destroy
        sign_out!
        redirect_to new_session_url
    end

end
