class CatsController < ApplicationController

  before_action :require_current_user!


  def index
    @cats = Cat.all
    render :index
  end

  def show
    @cat = Cat.find(params[:id])
    render :show
  end

  def new
    @cat = Cat.new
    render :new
  end

  def create
    @cat = Cat.new(cat_params)
    @cat.update_attribute(:user_id, current_user.id)

    if @cat.save
      redirect_to cat_url(@cat)
    else
      flash.now[:errors] = @cat.errors.full_messages
      render :new
    end
  end

  def edit
    @cat = current_user.cats.find_by(id: params[:id])
    if @cat
      render :edit
    else
      redirect_to cats_url
    end
  end

  def update
    @cat = Cat.find(params[:id])
    if @cat.update_attributes(cat_params) 
      redirect_to cat_url(@cat)
    else
      flash.now[:errors] = @cat.errors.full_messages
      render :edit
    end
  end

  private

  def cat_params
    params.require(:cat).permit(:age, :birth_date, :color, :description, :name, :sex)
  end
end



# defined actions: [:show, :edit, :update, :destroy]
# before_action :set_newsletter_email, only: [:show, :edit]
# The set_newsletter_email method will be called just before the show and edit actions.

# The opposite option except define when NOT to execute the method/block.

# defined actions: [:show, :edit, :update, :destroy]
# before_action :set_newsletter_email, except: [:show, :edit]
# The set_newsletter_email method will be called for all existing actions EXCEPT show and edit.