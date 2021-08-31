class ProductsController < ApplicationController
    before_action :find_product, only: [:edit, :detroy, :update, :show]
    before_action :set_product, only: [:edit, :update, :show, :destroy]
        
    def index
        @category = Category.find(params[:category_id])
        @products = @category.products.all.order("created_at DESC")
    end

    def show
    end 

    def new 
        @product = Product.new
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
        redirect_to root_path
    end

    def update
        if @product.update(params.require(:product).permit(:description, :price, :title))
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
        params.require(:product).permit(:title, :image, :description, :price, :category_id)
    end

    def find_product
        @product = Product.find(params[:id])
    end
    
end
