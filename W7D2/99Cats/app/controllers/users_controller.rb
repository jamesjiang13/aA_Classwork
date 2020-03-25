class UsersController < ApplicationController
    def new 
        if !current_user
            render :new
        else
            redirect_to cats_url
        end
    end

    def show
        render :show
    end

    def create
        @user = User.new(user_params)

        
        if @user.save
            login!(@user)
            redirect_to cats_url
        else
            nil
        end
    end
    
    private

    def user_params
        params.require(:user).permit(:username, :password)
    end

end

