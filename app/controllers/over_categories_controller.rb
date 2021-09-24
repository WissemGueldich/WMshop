class OverCategoriesController < ApplicationController
  before_action :set_over_category, only: %i[ show edit update destroy ]

  # GET /over_categories or /over_categories.json
  def index
    @over_categories = OverCategory.all
  end

  # GET /over_categories/1 or /over_categories/1.json
  def show
  end

  # GET /over_categories/new
  def new
    @over_category = OverCategory.new
  end

  # GET /over_categories/1/edit
  def edit
  end

  # POST /over_categories or /over_categories.json
  def create
    @over_category = OverCategory.new(over_category_params)

    respond_to do |format|
      if @over_category.save
        format.html { redirect_to @over_category, notice: "Over category was successfully created." }
        format.json { render :show, status: :created, location: @over_category }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @over_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /over_categories/1 or /over_categories/1.json
  def update
    respond_to do |format|
      if @over_category.update(over_category_params)
        format.html { redirect_to @over_category, notice: "Over category was successfully updated." }
        format.json { render :show, status: :ok, location: @over_category }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @over_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /over_categories/1 or /over_categories/1.json
  def destroy
    @over_category.destroy
    respond_to do |format|
      format.html { redirect_to over_categories_url, notice: "Over category was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_over_category
      @over_category = OverCategory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def over_category_params
      params.require(:over_category).permit(:name)
    end
end
