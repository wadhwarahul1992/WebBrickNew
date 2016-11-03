class Admin::CategoriesController < Admin::BaseController

  before_action :set_category, only: [:edit, :update, :destroy, :show]

  def index
    @categories = Category.all.order(:name)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = 'Category successfully created.'
      redirect_to action: :index
    else
      render action: :new
    end
  end

  def edit

  end

  def update
    if @category.update_attributes(category_params)
      flash[:success] = 'Category Successfully updated'
      redirect_to action: :index
    else
      render action: :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to action: :index
  end

  def show

  end

  private

  def set_category
    @category = Category.find params[:id]
  end

  def category_params
    params.require(:category).permit(:name)
  end

end