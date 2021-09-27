class CategoryGroupsController < ApplicationController
  before_action :set_category_group, only: %i[ show edit update destroy ]

  # GET /category_groups or /category_groups.json
  def index
    @category_groups = CategoryGroup.all
  end

  # GET /category_groups/1 or /category_groups/1.json
  def show
    @categories = Category.where(category_group_id: params[:id])
  end

  # GET /category_groups/new
  def new
    @category_group = CategoryGroup.new
  end

  # GET /category_groups/1/edit
  def edit
  end

  # POST /category_groups or /category_groups.json
  def create
    @category_group = CategoryGroup.new(category_group_params)

    respond_to do |format|
      if @category_group.save
        format.html { redirect_to @category_group, notice: "Sub-Category was successfully created." }
        format.json { render :show, status: :created, location: @category_group }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @category_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /category_groups/1 or /category_groups/1.json
  def update
    respond_to do |format|
      if @category_group.update(category_group_params)
        format.html { redirect_to @category_group, notice: "Sub-Category was successfully updated." }
        format.json { render :show, status: :ok, location: @category_group }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @category_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /category_groups/1 or /category_groups/1.json
  def destroy
    @category_group.destroy
    respond_to do |format|
      format.html { redirect_to category_groups_url, notice: "Category group was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category_group
      @category_group = CategoryGroup.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def category_group_params
      params.require(:category_group).permit(:name, :over_category_id)
    end
end
