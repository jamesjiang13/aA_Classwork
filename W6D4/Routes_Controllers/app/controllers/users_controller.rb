class UsersController < ApplicationController

    def index
        users = User.all
        render json: users
    end

    def create
        user = User.new(user_params)

        if user.save
            redirect_to "/users/#{user.id}"
        else
            render json: user.errors.full_messages, status: 422
        end
            
    end

    def show
        user = User.find(params[:id])
        render json: user
    end

    def update
        user = User.find(params[:id])

        if user.update(user_params)
            redirect_to "/users/#{user.id}"
        else
            render json: user.errors.full_messages, status: 422
        end
    end

    def destroy
        user = User.find(params[:id])
        
        user.destroy   # .destroy ? is a native rails method?

        render json: user
    end

    def edit # all edits for a user?
        @user = User.find(params[:id])
        render json: user
    end

    # https://stackoverflow.com/questions/33198766/explanation-of-user-new-in-ruby-on-rails-from-michael-hartls-tutorial
    def new
        user = User.new
        render json: user
    end

    # def edit
    #     @article = Article.find(params[:id])
    # end
    #https://learn.co/lessons/rails-edit-update-action-readme
    private
    
    def user_params
        params.require(:user).permit(:name,:email)
    end

end
