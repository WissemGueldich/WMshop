class CategoriesController < ApplicationController
    before_action :set_categories, only: [:index, :show, :update, :destroy, :edit]

    def index
      @categories = Category.all
      @pagy, @products =  pagy(Product.where(category_id: @category.id).order("created_at DESC"),items: 12)
      prices=[]
      @products.each do |p|
          prices.push(p.price)
      end
      @min_price=prices.min
      @max_price=prices.max
      @pagy, @products = pagy(@products.filter_by_rating(params[:rating]), items: 12) if params[:rating].present?
      @pagy, @products = pagy(@products.filter_by_min_price(params[:min_price]), items: 12) if params[:min_price].present?
      @pagy, @products = pagy(@products.filter_by_max_price(params[:max_price]), items: 12) if params[:max_price].present?
      prices=[]
      @products.each do |p|
          prices.push(p.price)
      end
      @min_price_set=prices.min
      @max_price_set=prices.max
      @rating = Rating.new

    end
  
    def new
      @category = Category.new
    end
  
    def edit
    end
  
    def create
      @category = Category.new(categories_params)
      if @category.save
        redirect_to category_products_path(@category), notice: 'Variant was successfully created'
      else
          redirect_to new_category_path
      end
    end
    def update
      if @category.update(categories_params)
        redirect_to category_products_path(@category), notice: 'Variant was successfully updated'
      else
          render "edit"
      end
    end
  
    def show
    end
  
    def destroy
      if @category.destroy
        redirect_to categories_path, notice: 'Variant was successfully deleted'
      end
    end

    private

  def set_categories
    @category = Category.find(params[:id])
  end

  def categories_params
    params.require(:category).permit(
      :title, :category_group_id
    )
  end
end
