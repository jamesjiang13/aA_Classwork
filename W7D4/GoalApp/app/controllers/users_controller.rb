class UsersController < ApplicationController
    def index
        @users = User.all
        render :index
    end

    def show
        @user = User.find(params[:id])
        render :show
    end

    def new
        @user = User.new
        render :new
    end

    def create
        @user = User.new(user_params)

        if @user.save
            login!(@user)
            redirect_to user_url(@user) # want to show the users page after logging in
            # redirect_to /users/(@user.id) 
        else
            flash.new[:errors] = @user.errors.full_messages
            render :new
        end
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to new_user_url 
        
    end

    private

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end
    
end
