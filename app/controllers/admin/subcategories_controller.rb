class Admin::SubcategoriesController < Admin::BaseController

  before_action :set_subcategory, only: []

  def index
    @subcategories = Subcategory.all
  end

  def new
    @subcategory = Subcategory.new
  end

  def create
    @subcategory = Subcategory.new(subcategory_params)
    if @subcategory.save
      flash[:success] = 'Subcategory Successfully Created.'
      redirect_to action: :index
    else
      render action: :new
    end
  end

  private

  def set_subcategory
    @subcategory = Subcategory.find params[:id]
  end

  def subcategory_params
    params.require(:subcategory).permit(:name,
                                        :category_id,
                                        :type)
  end

end