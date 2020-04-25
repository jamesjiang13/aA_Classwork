class Api::SessionsController < ApplicationController
  before_action :require_signedin, only: [:destroy]

  def create
    @user = User.find_by_credentials(user_params[:username], user_params[:password])
    if @user.nil?
      render json: [@user.errors], status: 422
    else
      login(@user)
      render '/api/users/show'
    end
  end
  
  def destroy 
    logout
    render json: {message: "logout successful"}
  end

end
