class CategoriesController < ApplicationController
    before_action :set_categories, only: [:show, :update, :destroy, :edit]

    def index
      @categories = Category.all
      @products = Product.all.order("created_at DESC")
    end
  
    def new
      @category = Categories.new
    end
  
    def edit
    end
  
    def create
      @category = Category.new(categories_params)
    end
  
    def update
      @category.update(categories_params)
    end
  
    def show
    end
  
    def destroy
      @category.destroy
    end



    private

  def set_categories
    @category = Category.find(params[:id])
  end

  def categories_params
    params.require(:category).permit(
      :title
    )
  end
end
