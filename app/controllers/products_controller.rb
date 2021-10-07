class ProductsController < ApplicationController
    before_action :find_product, only: [:edit, :detroy, :update, :show]
    before_action :set_product, only: [:edit, :update, :show, :destroy]
        
    def index
        @pagy, @products = pagy(Product.all.order("created_at DESC"),items: 12)
    end

    def show
        @comment = Comment.new
        @rating = Rating.new
        @reviews = @product.ratings
        if @reviews.length == 0
            @avg_rating = 0
        else
            @avg_rating = @reviews.average(:score).round
        end
        @comments = Comment.where(product_id: @product.id).order("created_at DESC")
    end 

    def new 
        @product = Product.new
    end

    def search
        @pagy, @products = pagy(Product.ransack(title_cont: params[:q]).result(distinct: true),items: 12)
        prices=[]
        @products.each do |p|
            prices.push(p.price)
        end
        @min_price=prices.min
        @max_price=prices.max
        #@pagy, @products = pagy(@products.filter_by_category(params[:category_id]), items: 12) if params[:category_id].present?
        @pagy, @products = pagy(@products.filter_by_rating(params[:rating]), items: 12) if params[:rating].present?
        @pagy, @products = pagy(@products.filter_by_min_price(params[:min_price]), items: 12) if params[:min_price].present?
        @pagy, @products = pagy(@products.filter_by_max_price(params[:max_price]), items: 12) if params[:max_price].present?
        prices=[]
        @products.each do |p|
            prices.push(p.price)
        end
        @min_price_set=prices.min
        @max_price_set=prices.max
        respond_to do |format|
            format.html {}
            format.json {
                @products=@products.limit(5)
                puts(@products)
            }
        end
    
    end

    def edit 
    end

    def create
        @product = Product.new(product_params)
        if @product.save
            redirect_to root_path, notice: 'Product was successfully created'
        else
            redirect_to new_category_product_path
        end
    end

    def destroy
        @product.destroy
        redirect_to root_path, notice: "Product has been deleted successfully!"
    end

    def update
        if @product.update(params.require(:product).permit(:title, :image, :ad, :description, :price, :category_id, :show_ad))
            redirect_to @product, notice: 'Product was successfully updated'
        else
            render "edit" 
        end
    end

    private

    def set_product
        @product = Product.find(params[:id])
    end

    def product_params
        params.require(:product).permit(:title, :image, :ad, :description, :price, :category_id, :show_ad)
    end

    def find_product
        @product = Product.find(params[:id])
    end
    
end