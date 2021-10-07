class RatingsController < ApplicationController
  before_action :set_rating, only: %i[ show edit update destroy ]
  before_action :require_user_logged_in!

  # GET /ratings or /ratings.json
  def index
    @ratings = Rating.all
  end

  # GET /ratings/1 or /ratings/1.json
  def show
  end

  # GET /ratings/new
  def new
    @rating = Rating.new
  end

  # GET /ratings/1/edit
  def edit
  end

  # POST /ratings or /ratings.json
  def create
    @ratings = Rating.where(user_id: params[:rating][:user_id],product_id: params[:rating][:product_id])
    if @ratings.length !=0
      @rating = @ratings[0]
      @rating.update(rating_params)
    else
      @rating = Rating.new(rating_params)
      @rating.save
    end
    product = @rating.product
    product.rating = product.ratings.average(:score).round
    product.save
    
  end

  # PATCH/PUT /ratings/1 or /ratings/1.json
  def update
    @rating.update(rating_params)
  end

  # DELETE /ratings/1 or /ratings/1.json
  def destroy
    @rating.destroy
    respond_to do |format|
      format.html { redirect_to ratings_url, notice: "Rating was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rating
      @rating = Rating.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def rating_params
      params.require(:rating).permit(:score, :user_id, :product_id)
    end
end
