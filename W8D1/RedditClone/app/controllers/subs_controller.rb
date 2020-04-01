class SubsController < ApplicationController

    before_action :require_signed_in! , only: [:edit, :update]

    def index
        @subs = Sub.all
        render :index
    end

    def new
        @sub = Sub.new
        render :new
    end

    def create
        @sub = Sub.new(sub_params)
        # debugger
        @sub.moderator_id = current_user.id # come back if errors

        if @sub.save
            redirect_to user_url(current_user.id)
        else
            flash.now[:errors] = @sub.errors.full_messages
            redirect_to user_url(current_user.id)
        end
    end 

    def show
        @sub = Sub.find(params[:id])
        render :show
    end
    
    def edit
        @sub = Sub.find_by(id: params[:id])
        render :edit
    end

    # def update
    #     @sub = Sub.find_by(id: params[:id])
       
    #     if @sub.update(sub_params) && @sub.moderator_id == current_user.id
    #         redirect_to user_url(@sub.moderator_id)
    #     else
    #         flash[:errors] = @sub.errors.full_messages
    #         redirect_to user_url(@sub.moderator_id)
    #     end
    # end

    def update
        @sub = current_user.subs.find_by(id: params[:id])
        # debugger
        if @sub && @sub.update
            redirect_to user_url(@sub.moderator_id)
        else
            # flash[:errors] = @sub.errors.full_messages
            redirect_to user_url(@sub.moderator_id)
        end
    end

    # toy = Toy.find(params[:id])
    # sucess = toy.update(cat_id: params[:toy][:cat_id], name: params:[:toy][:name], ttype: params[:toy][:type]) 
 

    private

    def sub_params
        params.require(:sub).permit(:title, :description)
        
    end

end


# fix nested routes for subs/users
# fix redirecting to users show page after creation of sub