class ProductsController < ApplicationController
    before_action :find_product, only: [:edit, :detroy, :update, :show]
    before_action :set_product, only: [:edit, :update, :show, :destroy]
        
    def index
        @pagy, @products = pagy(Product.all.order("created_at DESC"),items: 12)
    end

    def show
        @rating = Rating.new
        @reviews = @product.ratings
        if @reviews.length == 0
            @avg_rating = 0
        else
            @avg_rating = @reviews.average(:score).round
        end
    end 

    def new 
        @product = Product.new
    end

    def search
        @products = Product.ransack(title_cont: params[:q]).result(distinct: true)
        
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
            redirect_to new_product_path
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